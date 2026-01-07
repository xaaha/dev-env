## Enabling profiling
# zmodload zsh/zprof

#plugin manager zap
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY       # append to history file, don’t overwrite
setopt INC_APPEND_HISTORY   # write each command to history immediately
setopt SHARE_HISTORY        # share history across all sessions
setopt HIST_IGNORE_ALL_DUPS # only keep one occurrence of a command
setopt HIST_FIND_NO_DUPS    # don't show duplicates when searching
setopt HIST_IGNORE_SPACE    # ignore commands that start with a space
HISTSIZE=2000
SAVEHIST=2000

# plugins
plug "hlissner/zsh-autopair"
plug "zap-zsh/vim"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "Aloxaf/fzf-tab"

# source local files
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/functions.zsh"
plug "$HOME/.config/zsh/secrets.zsh"
plug "$HOME/.config/zsh/prompt.zsh"

# keybinds
bindkey '^ ' autosuggest-accept

export PATH="$HOME/.local/bin":$PATH

## profiling
# zprof
