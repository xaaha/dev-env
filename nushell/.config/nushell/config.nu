# config.nu

$env.config.show_banner = false

use ($nu.default-config-dir | path join mise.nu)
source ($nu.default-config-dir | path join zoxide.nu)

# --- History ---
$env.config.history = {
    file_format: sqlite
    max_size: 2000
    sync_on_enter: true
    isolation: false
}

# --- macOS dynamic library paths ---
if $nu.os-info.name == "macos" {
    load-env {
        DYLD_LIBRARY_PATH: "/opt/homebrew/lib/"
        DYLD_FALLBACK_LIBRARY_PATH: "/opt/homebrew/lib"
    }
}

# --- Aliases (mise [shell_alias] doesn't support nushell) ---

# Navigation
alias j = z
alias h = hulak

# Tools
alias cat = bat
alias g = lazygit
alias grep = ^grep --color=auto
alias pip = pip3
alias v = nvim
alias fzf = ^fzf --height=40% --layout=reverse --border

# Safety - uses external coreutils for -i (interactive) flag
alias cp = ^cp -i
alias mv = ^mv -i
alias rm = ^rm -i

# tmux
alias t = tmux
alias ts = tmux ls
alias tn = tmux new -s
alias ta = tmux a
alias tat = tmux a -t

# --- Directory shortcuts ---

def --env dl [] { cd ~/Downloads }
def --env dt [] { cd ~/Desktop }
def --env dc [] { cd ~/Documents }
def --env icloud [] { cd ($env.HOME | path join "Library" "Mobile Documents" "com~apple~CloudDocs") }

# --- Utility functions ---

# Open file from fzf in nvim
def vo [] {
    let file = (fzf | str trim)
    if ($file | is-not-empty) {
        ^nvim $file
    }
}

# Enter a dir in nvim with Oil
def ve [] {
    let dir = (^fd -t d | fzf | str trim)
    if ($dir | is-not-empty) {
        ^nvim --cmd $"cd ($dir)" -c "Oil"
    }
}

# cd to child directory via fzf
def --env cdh [] {
    let dir = (^fd -t d --max-depth=1 --no-hidden | ^sort | fzf --prompt="Select directory> " | str trim)
    if ($dir | is-not-empty) {
        cd $dir
    }
}

# cd to sibling directory via fzf
def --env cdb [] {
    let dir = (^fd -t d --max-depth=1 --no-hidden . .. | ^sort | fzf --prompt="Select directory> " | str trim)
    if ($dir | is-not-empty) {
        cd $dir
    }
}

# Yazi shell wrapper for smarter cd
def --env y [...args] {
    let tmp = (^mktemp -t "yazi-cwd.XXXXXX" | str trim)
    ^yazi ...$args --cwd-file $tmp
    let cwd = (open $tmp | str trim)
    if ($cwd | is-not-empty) and $cwd != $env.PWD {
        cd $cwd
    }
    ^rm -f $tmp
}

# --- Git worktree functions ---

# Git worktree add with dependency setup
def --env gwa [branch: string] {
    let current_branch = (^git symbolic-ref --short HEAD | str trim)
    if ($current_branch | is-empty) {
        print "Not on a branch (HEAD is detached)"
        return
    }

    let base_branch = $current_branch
    let repo_root = (^git rev-parse --show-toplevel | str trim)
    let repo_name = ($repo_root | path basename)
    let branch_short = ($branch | str substring 0..<15)
    let worktree_folder = $"../($repo_name)-($branch_short)"

    print $"Setting up worktree at: ($worktree_folder)"
    ^git fetch origin

    let remote_exists = (do { ^git ls-remote --exit-code --heads origin $branch } | complete).exit_code == 0
    let local_exists = (do { ^git show-ref --verify --quiet $"refs/heads/($branch)" } | complete).exit_code == 0

    if $remote_exists {
        print $"Checking out existing remote branch '($branch)'..."
        ^git worktree add --track -b $branch $worktree_folder $"origin/($branch)"
    } else if $local_exists {
        print $"Branch '($branch)' exists locally. Creating worktree..."
        ^git worktree add $worktree_folder $branch
    } else {
        print $"Creating new branch '($branch)' from '($base_branch)'..."
        ^git worktree add -b $branch $worktree_folder $base_branch
    }

    # Copy .env if exists
    let env_file = ($repo_root | path join ".env")
    if ($env_file | path exists) {
        print "Copying .env..."
        ^cp $env_file ($worktree_folder | path join ".env")
    } else {
        print "No .env file found. Skipping copy."
    }

    # Node dependencies
    if ($repo_root | path join "yarn.lock" | path exists) {
        print "Installing Node dependencies with yarn..."
        do { cd $worktree_folder; ^yarn install }
    } else if ($repo_root | path join "package-lock.json" | path exists) {
        print "Installing Node dependencies with npm..."
        do { cd $worktree_folder; ^npm install }
    } else if ($repo_root | path join "pnpm-lock.yaml" | path exists) {
        print "Installing Node dependencies with pnpm..."
        do { cd $worktree_folder; ^pnpm install }
    } else {
        print "No Node lock file detected. Skipping."
    }

    # Ruby dependencies
    if ($repo_root | path join "Gemfile" | path exists) {
        print "Checking for Ruby dependencies..."
        do {
            cd $worktree_folder
            let check = (do { ^bundle check } | complete)
            if $check.exit_code != 0 { ^bundle install }
        }
    }

    # Go dependencies
    if ($repo_root | path join "go.mod" | path exists) {
        print "Checking for Go dependencies..."
        do { cd $worktree_folder; ^go mod tidy }
    }

    # Python dependencies
    if ($repo_root | path join "pyproject.toml" | path exists) or ($repo_root | path join "requirements.txt" | path exists) {
        print "Checking for Python virtual environment..."
        do {
            cd $worktree_folder
            if not (".venv" | path exists) {
                print "Creating Python virtual environment..."
                ^python3 -m venv .venv
            }
            print "Installing dependencies..."
            if ("requirements.txt" | path exists) {
                ^.venv/bin/pip install -r requirements.txt
            } else if ("pyproject.toml" | path exists) {
                ^.venv/bin/pip install .
            }
        }
    }

    print "Worktree setup complete!"
    cd $worktree_folder
}

# Remove git worktree via fzf
def --env gwr [] {
    # If on a worktree, switch to main first
    if (".git" | path exists) and (".git" | path type) == "file" {
        let content = (open .git | str trim)
        if ($content | str starts-with "gitdir:") {
            let main_worktree = (^git worktree list --porcelain
                | lines
                | where {|line| $line | str starts-with "worktree "}
                | first
                | str replace "worktree " "")
            cd $main_worktree
            ^git checkout main
        }
    }

    let worktrees = (^git worktree list | lines | skip 1 | str join "\n")
    if ($worktrees | is-not-empty) {
        let selected = ($worktrees | fzf --prompt="Select worktree to remove> " | str trim | split row --regex '\s+' | first)
        if ($selected | is-not-empty) {
            ^git worktree remove $selected
        }
    }
}

# --- Work: Genesis AWS Login ---

def loginGene [profile: string] {
    let full_profile = $"guild-($profile)"
    let repo_root = (^git rev-parse --show-toplevel | str trim)

    if not ($repo_root | path join "node_modules" | path exists) {
        print "node_modules not found. Running yarn install..."
        ^yarn install
        if $env.LAST_EXIT_CODE != 0 {
            print "Yarn install failed!"
            return
        }
    }

    print $"Logging into AWS SSO with profile: ($full_profile)..."
    ^aws sso login --profile $full_profile

    if $env.LAST_EXIT_CODE == 0 {
        print "AWS Login successful, running Yarn login command..."
        ^yarn dev:aws:login
    } else {
        print "AWS Login failed!"
    }
}
