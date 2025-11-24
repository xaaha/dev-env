#!/bin/zsh

autoload -Uz vcs_info
autoload -U colors && colors

zstyle ':vcs_info:*' enable git

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[yellow]%}%{$fg[red]%}%u%c%{$fg[magenta]%} %b%{$fg[blue]%}%{$reset_color%}"

PROMPT="%B%(?:%{$fg_bold[green]%}%c:%{$fg_bold[red]%}%c )%{$reset_color%}"
PROMPT+="\$vcs_info_msg_0_ $ "
