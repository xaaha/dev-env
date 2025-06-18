#!/bin/sh

# basics
alias cy="pbcopy"
alias pe="pbpaste"

# common directories
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dc="cd ~/Documents"
alias pp="cd ~/Documents/Projects"

alias cwd="pwd | pbcopy"
alias cat='bat'
alias g='lazygit'
# Colorize grep output (good for log files)
alias grep='grep --color=auto'

alias pip=pip3
alias pn=pnpm
alias python=python3
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

# get top process eating memory
# alias psmem='ps aux -m | head -6 | awk '\''NR==1 {print "PID\tCOMMAND\tUSER\t%CPU\t%MEM\tVSZ\tRSS\tTT\tSTAT\tSTARTED\tTIME"; next} {printf "\033[1;32m%-8s\033[0m\t\033[1;34m%-s\033[0m\t%-10s\t%-4s\t%-4s\t%-7s\t%-7s\t%-4s\t%-4s\t%-8s\t%-8s\n", $2, $11, $1, $3, $4, $5, $6, $7, $8, $9, $10}'\'' | column -t | fold -s -w $(tput cols)'

# get top process eating cpu
# alias pscpu='ps aux | sort -nr -k 3 | head -5 | awk '\''NR==1 {printf "\033[1;37m%-8s\t%-30s\t%-10s\t%-4s\t%-4s\t%-7s\t%-7s\t%-4s\t%-4s\t%-8s\t%-8s\n\033[0m", "PID", "COMMAND", "USER", "%CPU", "%MEM", "VSZ", "RSS", "TT", "STAT", "STARTED", "TIME"} {printf "\033[1;32m%-8s\033[0m\t\033[1;34m%-30s\033[0m\t%-10s\t%-4s\t%-4s\t%-7s\t%-7s\t%-4s\t%-4s\t%-8s\t%-8s\n", $2, $11, $1, $3, $4, $5, $6, $7, $8, $9, $10}'\'' | column -t | fold -s -w $(tput cols)'

