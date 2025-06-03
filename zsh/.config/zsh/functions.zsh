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

function hg(){
  # call hulak with global
  local file
  file=$(fd -e yml -e yaml | fzf) || return 1
  hulak -fp "$file"
}

function hs(){
  # call hulak with stagin 
  local file
  file=$(fd -e yml -e yaml | fzf) || return 1
  hulak -env staging -fp "$file"
}

function hp(){
  # call hulak with prod file
  local file
  file=$(fd -e yml -e yaml | fzf) || return 1
  hulak -env prod -fp "$file"
}


# for new and temp dir when jump is not useful
function cdh() {
  # Use fd to search for directories up to a maximum depth of 1,
  # excluding hidden directories (using the --no-hidden flag).
  local dir
  dir=$(fd -t d --max-depth=1 --no-hidden | sort | fzf --prompt="Select directory> ") || return 1
  cd "$dir" || return 1
}

function cdb() {
    local dir
    # List directories in the parent directory (../) with a depth of 1 (direct children)
    dir=$(fd -t d --max-depth=1 --no-hidden . .. | sort | fzf --prompt="Select directory> ") || return 1
    # Remove any leading "./" or "../" from the selected directory path
    dir=${dir}
    # Change to the directory
    cd "$dir" || return 1
}


# git worktree add, copy .env file and do a fresh install for node_modules 
function gwa() {
    if [ -z "$1" ]; then
        echo "Usage: gwa <branch-name>"
        return 1
    fi

    # Get current branch name
    current_branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [ -z "$current_branch" ]; then
        echo "❌ Not on a branch (HEAD is detached)"
        return 1
    fi
    
    # Store the base branch for creating the worktree
    base_branch="$current_branch"

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
        echo "🌱 Creating new branch '$branch' from '$base_branch'..."
        git worktree add -b "$branch" "$worktree_folder" "$base_branch"
    fi

    # Copy .env if it exists
    if [ -e "$repo_root/.env" ]; then
        echo "📄 Copying .env..."
        cp "$repo_root/.env" "$worktree_folder/.env"
    else
        echo "🚧 No .env file found. Skipping copy."
    fi

    # Install Node dependencies if applicable
    echo "📦 Checking for Node dependencies..."
    if [ -f "$repo_root/yarn.lock" ]; then
        (cd "$worktree_folder" && yarn install)
    elif [ -f "$repo_root/package-lock.json" ]; then
        (cd "$worktree_folder" && npm install)
    elif [ -f "$repo_root/pnpm-lock.yaml" ]; then
        (cd "$worktree_folder" && pnpm install)
    else
        echo "❌ No Node lock file detected. Skipping Node dependency installation."
    fi

    # Install Ruby dependencies if applicable
    echo "💎 Checking for Ruby dependencies..."
    if [ -f "$repo_root/Gemfile" ]; then
        if [ -f "$repo_root/Gemfile.lock" ]; then
            (cd "$worktree_folder" && bundle check || bundle install)
        else
            (cd "$worktree_folder" && bundle install)
        fi
    else
        echo "❌ No Gemfile detected. Skipping Ruby dependency installation."
    fi

    # Handle Go modules if applicable
    echo "🐹 Checking for Go dependencies..."
    if [ -f "$repo_root/go.mod" ]; then
        (cd "$worktree_folder" && go mod tidy)
    else
        echo "❌ No go.mod file detected. Skipping Go dependency setup."
    fi

    echo "✅ Worktree setup complete!"

    # Change directory into the new worktree folder
    cd "$worktree_folder" || {
        echo "❌ Failed to change directory into $worktree_folder"
        return 1
    }
}

# Removes git worktree fzf is required.  
function gwr() {
    # If on a worktree, first switch to main branch in main worktree
    if [ -f .git ] && grep -q "^gitdir:" .git; then
        main_worktree=$(git worktree list --porcelain | grep '^worktree ' | awk '{print $2}' | head -1)
        cd "$main_worktree" || return 1
        git checkout main
    fi

    # List worktrees (excluding first/main one) and pipe to fzf for selection
    selected=$(git worktree list | tail -n +2 | fzf --prompt="Select worktree to remove> " | awk '{print $1}')
    
    # If a worktree was selected, remove it
    if [ -n "$selected" ]; then
        git worktree remove "$selected"
    fi
}

# yazi shell wrapper for smarter cd
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
