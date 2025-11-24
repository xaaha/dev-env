## Enabling profiling
# zmodload zsh/zprof

#plugin manager zap
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
HISTFILE=~/.zsh_history

# plugins
plug "hlissner/zsh-autopair"
plug "zap-zsh/vim"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"

# source local files
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/functions.zsh"
plug "$HOME/.config/zsh/secrets.zsh"

# prompt
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst

zstyle ':vcs_info:git:*' formats '%b '
PS1="%F{blue}%1~%f %F{red}${vcs_info_msg_0_}%f$ "

# keybinds
bindkey '^ ' autosuggest-accept

export PATH="$HOME/.local/bin":$PATH

## profiling
# zprof
