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
}
