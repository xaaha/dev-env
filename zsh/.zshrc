## Enabling profiling
# zmodload zsh/zprof

# source local files (always needed for PATH/env)
source "$HOME/.config/zsh/exports.zsh"
[[ -f "$HOME/.config/zsh/secrets.zsh" ]] && source "$HOME/.config/zsh/secrets.zsh"

# skip everything below for non-interactive shells (fzf subshells, scripts)
[[ ! -o interactive ]] && return

# history
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY INC_APPEND_HISTORY SHARE_HISTORY \
       HIST_IGNORE_ALL_DUPS HIST_FIND_NO_DUPS HIST_IGNORE_SPACE
HISTSIZE=2000
SAVEHIST=2000

# --- eager plugins (cheap or needed immediately) ---
_zsh_plug="$HOME/.local/share/zap/plugins"

source "$HOME/.config/zsh/functions.zsh"
source "$_zsh_plug/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey ‘^P’ autosuggest-accept

# --- deferred plugins (loaded after first prompt) ---
_defer_plugins() {
  add-zsh-hook -d precmd _defer_plugins
  unfunction _defer_plugins

  # compinit — skip compaudit unless zcompdump is stale
  autoload -Uz compinit
  if [[ -f "$HOME/.zcompdump" && $(date +’%j’) == $(stat -f ‘%Sm’ -t ‘%j’ "$HOME/.zcompdump" 2>/dev/null) ]]; then
    compinit -C
  else
    compinit
  fi

  source "$_zsh_plug/zsh-autopair/autopair.zsh"
  source "$_zsh_plug/fzf-tab/fzf-tab.plugin.zsh"
  # syntax-highlighting must be last
  source "$_zsh_plug/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

  unset _zsh_plug
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _defer_plugins

## profiling
# zprof
