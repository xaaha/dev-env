#!/usr/bin/env zsh

# History
HISTSIZE=2000
SAVEHIST=2000

# General exports
export SHELL_SESSIONS_DISABLE=1
export EDITOR="nvim"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

# --- PATH SETUP ---

# Go
export GOPATH="$HOME/go"
path=("$GOPATH/bin" $path)

# Bun
export BUN_INSTALL="$HOME/.bun"
path=("$BUN_INSTALL/bin" $path)
# Lazy-load Bun completions
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun" &!

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
path=("$PNPM_HOME" $path)

# Docker init (optional)
[[ -f "$HOME/.docker/init-zsh.sh" ]] && source "$HOME/.docker/init-zsh.sh"

# --- Conditional platform exports ---
case "$(uname -s)" in
  Darwin)
    export DYLD_LIBRARY_PATH=/opt/homebrew/lib/
    export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib
    ;;
esac

# --- Lazy evals ---
# Defer these heavy ones until needed
function _init_mise() {
  unfunction _init_mise
  eval "$(mise activate zsh)"
}
function _init_jump() {
  unfunction _init_jump
  eval "$(jump shell)"
}
function _init_zoxide() {
  unfunction _init_zoxide
  eval "$(zoxide init zsh)"
}

# Auto-load them on demand (when you first use these commands)
autoload -Uz add-zsh-hook
add-zsh-hook precmd _init_zoxide
add-zsh-hook precmd _init_jump
add-zsh-hook precmd _init_mise

# --- FZF setup ---
# Only source fzf if it exists
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

if [[ -r "/opt/homebrew/opt/fzf/shell/completion.zsh" ]]; then
  source /opt/homebrew/opt/fzf/shell/completion.zsh
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
elif [[ -r "/usr/share/fzf/completion.zsh" ]]; then
  source /usr/share/fzf/completion.zsh
  source /usr/share/fzf/key-bindings.zsh
fi
