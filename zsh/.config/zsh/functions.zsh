function jwtd () {
  local input="${1:-}"
  if [ -z "$input" ]; then
    if [ ! -t 0 ]; then
      input=$(cat /dev/stdin)
    else
      echo >&2 '✗ Need an argument or have a piped input!'
      return 1
    fi
  fi

  # Split JWT into parts and decode each part
  echo "$input" | awk -F'.' '{print $1"\n"$2}' | while read -r part; do
    decoded=$(echo "$part" | tr '_-' '/+' | base64 -d 2>/dev/null)
    if [ $? -eq 0 ]; then
      # Validate and format as JSON using jq
      echo "$decoded" | jq . 2>/dev/null
      if [ $? -ne 0 ]; then
        echo "✗ Decoded part is not valid JSON: \n $decoded" >&2
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

# git worktree add and symlink the .env file if it exists
gwa() {
    if [ -z "$1" ]; then
        echo "Usage: gwa <new-branch-name>"
        return 1
    fi

    local new_branch="$1"
    local repo_root
    repo_root=$(git rev-parse --show-toplevel)  # Get full path of the repo root
    local repo_name
    repo_name=$(basename "$repo_root")  # Extract repo folder name
    local base_branch
    base_branch=$(git rev-parse --abbrev-ref HEAD)  # Get current branch
    local branch_short="${new_branch:0:15}"  # Limit branch name to 15 chars
    local worktree_folder="../${repo_name}-${branch_short}"  # Create folder one level up

    echo "🚀 Creating worktree at: $worktree_folder from branch: $base_branch"

    # Create Git worktree from the current branch
    git worktree add "$worktree_folder" -b "$new_branch" "$base_branch"

    # Copy .env if it exists
    if [ -e "$repo_root/.env" ]; then
        echo "📄 Copying .env..."
        cp -r "$repo_root/.env" "$worktree_folder/.env"
    else
        echo "🚧 No .env file or folder found. Skipping copy."
    fi

    # Symlink node_modules if it exists
    if [ -d "$repo_root/node_modules" ]; then
        echo "🔗 Symlinking node_modules..."
        ln -s "$repo_root/node_modules" "$worktree_folder/node_modules"
    else
        echo "🚧 No node_modules found in the root. Checking for lock files to install dependencies..."

        # Detect package manager and install dependencies
        if [ -f "$repo_root/yarn.lock" ]; then
            echo "📦 Detected yarn.lock, running yarn install..."
            (cd "$worktree_folder" && yarn install)
        elif [ -f "$repo_root/package-lock.json" ]; then
            echo "📦 Detected package-lock.json, running npm install..."
            (cd "$worktree_folder" && npm install)
        elif [ -f "$repo_root/pnpm-lock.yaml" ]; then
            echo "📦 Detected pnpm-lock.yaml, running pnpm install..."
            (cd "$worktree_folder" && pnpm install)
        else
            echo "❌ No lock file detected. Skipping dependency installation."
        fi
    fi

    echo "✅ Worktree setup complete!"
}
