# config.nu

$env.config.show_banner = false
$env.config.buffer_editor = "nvim"
$env.EDITOR = "nvim"
# $env.config.edit_mode = 'vi'

use ($nu.default-config-dir | path join mise.nu)
source ($nu.default-config-dir | path join zoxide.nu)
use ($nu.default-config-dir | path join starship.nu)

# --- History ---
$env.config.history = {
    file_format: sqlite
    max_size: 10000
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

# Regenerate cached shell integration scripts after tool updates
def nu-refresh [] {
    ^mise activate nu | save ($nu.default-config-dir | path join mise.nu) --force
    ^zoxide init nushell | save ($nu.default-config-dir | path join zoxide.nu) --force
    ^mise exec starship -- starship init nu | save ($nu.default-config-dir | path join starship.nu) --force
    print "Regenerated mise.nu, zoxide.nu, starship.nu. Restart Nu to apply."
}
