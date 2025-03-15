function wakeup() {
    local duration=$1

    if [[ -z "$duration" ]]; then
        echo "Keeping the screen awake indefinitely... Ctrl + C to exit"
        caffeinate -d  
    else
        # Extract the number and the unit (m for minutes, h for hours)
        local time_value=${duration%[mh]}
        local time_unit=${duration: -1}

        # Check if time_value is a valid number
        if ! [[ "$time_value" =~ ^[0-9]+$ ]]; then
            echo "Invalid duration value. Please provide a positive integer followed by 'm' or 'h'."
            return 1
        fi

        if [[ "$time_unit" == "m" ]]; then
            local seconds=$((time_value * 60))
            echo "Keeping the screen awake for $time_value minutes ($seconds seconds)... Ctrl + C to exit"
            caffeinate -d -t $seconds  
        elif [[ "$time_unit" == "h" ]]; then
            local seconds=$((time_value * 3600))
            echo "Keeping the screen awake for $time_value hours ($seconds seconds)... Ctrl + C to exit"
            caffeinate -d -t $seconds 
        else
            echo "Invalid duration format. Use '15m', '1h', or no argument for indefinite."
            return 1
        fi
    fi
}

function bruc() {
  echo "Starting Homebrew maintenance..."

  # Update Homebrew
  if brew update; then
    echo "Homebrew updated successfully."
  else
    echo "Error: Homebrew update failed." >&2
    return 1
  fi

  # Upgrade installed packages
  if brew upgrade; then
    echo "Homebrew packages upgraded successfully."
  else
    echo "Error: Homebrew upgrade failed." >&2
    return 1
  fi

  # Cleanup old versions
  if brew cleanup; then
    echo "Homebrew cleanup completed successfully."
  else
    echo "Error: Homebrew cleanup failed." >&2
    return 1
  fi

  echo "Homebrew maintenance completed."
}


function jwtd () {
    local input="${1:-}" 
    if [ -z "$input" ]; then
        if [ ! -t 0 ]; then
            input=$(cat /dev/stdin)
        else
            echo '✗ Need an argument or have a piped input!' >&2
            return 1
        fi
    fi

    echo "$input" | awk -F'.' '{print $1"\n"$2}' | while read -r part; do
        decoded=$(echo "$part" | tr '_-' '/+' | base64 -d 2>/dev/null)
        if [ $? -eq 0 ]; then
            # Try pretty-printing as JSON
            if ! echo "$decoded" | jq . 2>/dev/null; then
                # If jq failed, check if the decoded payload is missing a trailing }
                # Remove any trailing whitespace and grab the last character.
                lastChar=$(echo -n "$decoded" | sed -e 's/[[:space:]]*$//' | tail -c 1)
                if [ "$lastChar" != "}" ]; then
                    fixed="${decoded}}"
                    if echo "$fixed" | jq . 2>/dev/null; then
                        echo "$fixed" | jq .
                    else
                        echo "✗ Decoded part is not valid JSON even after appending '}':" >&2
                        echo "$decoded" >&2
                    fi
                else
                    echo "✗ Decoded part is not valid JSON:" >&2
                    echo "$decoded" >&2
                fi
            fi
        else
            echo "✗ Failed to decode Base64 part: $part" >&2
        fi
    done
}

# open nvim with file from fzf
function vo() {
  local file
  file=$(fzf) || return 1  # Exit if no file is selected
  nvim "$file"
}

# git worktree add, copy .env file and do a fresh install for node_modules 
function gwa() {
    if [ -z "$1" ]; then
        echo "Usage: gwa <branch-name>"
        return 1
    fi

    local branch="$1"
    local repo_root
    repo_root=$(git rev-parse --show-toplevel)  # Get full path of the repo root
    local repo_name
    repo_name=$(basename "$repo_root")  # Extract repo folder name
    local branch_short="${branch:0:15}"  # Limit branch name to 15 chars
    local worktree_folder="../${repo_name}-${branch_short}"  # Worktree directory

    echo "🚀 Setting up worktree at: $worktree_folder"

    # Fetch latest branches
    git fetch origin

    # Check if the branch exists remotely
    if git ls-remote --exit-code --heads origin "$branch" >/dev/null; then
        echo "🌍 Checking out existing remote branch '$branch'..."
        git worktree add --track -b "$branch" "$worktree_folder" origin/"$branch"
    elif git show-ref --verify --quiet "refs/heads/$branch"; then
        echo "🔄 Branch '$branch' exists locally. Creating worktree..."
        git worktree add "$worktree_folder" "$branch"
    else
        echo "🌱 Creating new branch '$branch' in a new worktree..."
        git worktree add -b "$branch" "$worktree_folder"
    fi

    # Copy .env if it exists
    if [ -e "$repo_root/.env" ]; then
        echo "📄 Copying .env..."
        cp "$repo_root/.env" "$worktree_folder/.env"
    else
        echo "🚧 No .env file found. Skipping copy."
    fi

    # Fresh install node_modules 
    echo "📦 Checking for node Dependencies..."
    if [ -f "$repo_root/yarn.lock" ]; then
        (cd "$worktree_folder" && yarn install)
    elif [ -f "$repo_root/package-lock.json" ]; then
        (cd "$worktree_folder" && npm install)
    elif [ -f "$repo_root/pnpm-lock.yaml" ]; then
        (cd "$worktree_folder" && pnpm install)
    else
        echo "❌ No lock file detected. Skipping dependency installation."
    fi

    echo "✅ Worktree setup complete!"

    # Change directory into the new worktree folder
    cd "$worktree_folder" || {
        echo "❌ Failed to change directory into $worktree_folder"
        return 1
    }
}
