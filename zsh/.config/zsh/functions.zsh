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

# Removes git worktree fzf is required.  
function gwr(){
# either main or master   
MAIN_BRANCH="main"

function error_exit {
    echo "Error: $1" >&2
    exit 1
}

# Check that we're in a Git repository
git rev-parse --is-inside-work-tree > /dev/null 2>&1 || error_exit "Not inside a Git repository."

# Determine if we are in a worktree.
# If .git is a file (a gitdir pointer) then we are likely in a worktree.
if [ -f .git ]; then
    # Check if the content of .git points to a pointer file
    if grep -q "^gitdir:" .git ; then
        IN_WORKTREE=true
    else
        IN_WORKTREE=false
    fi
else
    IN_WORKTREE=false
fi

# Get current branch name. If HEAD is detached, this may fail.
CURRENT_BRANCH=$(git symbolic-ref --short HEAD 2>/dev/null)

if [ "$CURRENT_BRANCH" != "$MAIN_BRANCH" ] || [ "$IN_WORKTREE" = true ]; then
    echo "Switching to branch '$MAIN_BRANCH' in the main repository..."
    # Ensure we are in the main worktree.
    # If we are in a worktree, try switching directory into the main one
    # by checking if repository has a main worktree.
    # The main worktree is usually the one that contains .git (a directory, not a file).
    MAIN_WORKTREE=""
    while IFS= read -r line; do
        # The first line in git worktree list is the path.
        # We'll pick the worktree that contains a .git directory rather than a .git file.
        if [ -d "$line/.git" ]; then
            MAIN_WORKTREE="$line"
            break
        fi
    done < <(git worktree list --porcelain | grep '^worktree ' | awk '{print $2}')

    if [ -z "$MAIN_WORKTREE" ]; then
        error_exit "Could not determine main worktree directory."
    fi

    # Change directory to the main worktree if not already there.
    if [ "$PWD" != "$(cd "$MAIN_WORKTREE" && pwd)" ]; then
        echo "Changing directory to main worktree: $MAIN_WORKTREE"
        cd "$MAIN_WORKTREE" || error_exit "Failed to change directory."
    fi

    # Now checkout main branch.
    git checkout "$MAIN_BRANCH" || error_exit "Failed to checkout '$MAIN_BRANCH'."
fi

# List all registered worktrees and allow user to select one to remove.
# Note: We don't remove the main worktree.
echo "Select a worktree below to remove (excluding the main worktree):"
WORKTREE_LIST=$(git worktree list --porcelain | grep '^worktree ' | awk '{print $2}')
MAIN_WORKTREE=$(git rev-parse --show-toplevel)

# Filter out the main worktree from the list.
FILTERED_LIST=()
while IFS= read -r wt; do
    abs_wt="$(cd "$wt" && pwd)"
    main_abs="$(cd "$MAIN_WORKTREE" && pwd)"
    if [ "$abs_wt" != "$main_abs" ]; then
        FILTERED_LIST+=("$wt")
    fi
done < <(printf "%s\n" "$WORKTREE_LIST")

if [ ${#FILTERED_LIST[@]} -eq 0 ]; then
    echo "No extra worktrees found to remove."
    exit 0
fi

# Use fzf to select a worktree. 
SELECTED=$(printf "%s\n" "${FILTERED_LIST[@]}" | fzf --prompt="Select worktree to remove> ")
if [ -z "$SELECTED" ]; then
    echo "No worktree selected. Exiting."
    exit 0
fi

echo "Removing worktree: $SELECTED"
git worktree remove "$SELECTED" || error_exit "Failed to remove worktree."

echo "Worktree removed successfully."
}
