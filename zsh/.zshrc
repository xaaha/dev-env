# source local files (always needed for PATH/env)
source "$HOME/.config/zsh/exports.zsh"
[[ -f "$HOME/.config/zsh/secrets.zsh" ]] && source "$HOME/.config/zsh/secrets.zsh"

# non-interactive shells (fzf subshells, scripts) stop here
[[ ! -o interactive ]] && return

# history
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY INC_APPEND_HISTORY SHARE_HISTORY \
       HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS HIST_IGNORE_SPACE
HISTSIZE=2000
SAVEHIST=2000

# plugins
ZSH_PLUG="$HOME/.local/share/zsh/plugins"

source "$HOME/.config/zsh/functions.zsh"
source "$ZSH_PLUG/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^P' autosuggest-accept

# deferred (loads after first prompt renders)
_defer_plugins() {
  add-zsh-hook -d precmd _defer_plugins
  unfunction _defer_plugins

  autoload -Uz compinit
  if [[ -f "$HOME/.zcompdump" && $(date +'%j') == $(stat -f '%Sm' -t '%j' "$HOME/.zcompdump" 2>/dev/null) ]]; then
    compinit -C
  else
    compinit
  fi

  source "$ZSH_PLUG/zsh-autopair/autopair.zsh"
  source "$ZSH_PLUG/fzf-tab/fzf-tab.plugin.zsh"
  source "$ZSH_PLUG/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

  unset ZSH_PLUG
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _defer_plugins
