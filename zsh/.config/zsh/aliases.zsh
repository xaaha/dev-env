#!/bin/sh

# common directories
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dc="cd ~/Documents"
alias pp="cd ~/Documents/Projects"
if [[ "$(uname -s)" == "Darwin" ]]; then
  icloud() {
    cd ~/Library/Mobile\ Documents/com~apple~CloudDocs
  }
fi

alias cat='bat'
alias g='lazygit'
# Colorize grep output (good for log files)
alias grep='grep --color=auto'

alias pip=pip3
alias v="nvim"

# confirm before overwriting something
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

#tmux
alias t="tmux"
alias ts="tmux ls"
alias tn="tmux new -s"
alias ta="tmux a"
alias tat="tmux a -t"

alias pd="podman"
alias fzf="fzf --height=40% --layout=reverse --border"
