# keep this at the top
oh-my-posh init nu
zoxide init nushell | save -f ~/.zoxide.nu

$env.config.show_banner = false

#mise
use ($nu.default-config-dir | path join mise.nu)

### Aliases ###
alias v = nvim
alias m = mise

# common directories
alias dl = cd ~/Downloads
alias dt = cd ~/Desktop
alias dc = cd ~/Documents
alias pp = cd ~/Documents/Projects

alias g = lazygit
# Colorize grep output (good for log files)
alias grep = grep --color=auto

# alias ls = lsd
alias pip = pip3
alias pn = pnpm
alias python = python3
alias v = nvim

# confirm before overwriting something
alias cp = cp -i
alias mv = mv -i
alias rm = rm -i

#tmux
alias t = tmux
alias ts = tmux ls
alias tn = tmux new -s
alias ta = tmux a
alias tat = tmux a -t

# keep it at the bottom
source ~/.zoxide.nu
source ~/.oh-my-posh.nu

