#!/usr/bin/env zsh

export GITHUB_TOKEN=$(gh auth token)

# --- PATH SETUP ---

# Go
export GOPATH="$HOME/go"
path=("$GOPATH/bin" $path)

# # pnpm
# export PNPM_HOME="$HOME/Library/pnpm"
# path=("$PNPM_HOME" $path)

# Docker init (optional)
[[ -f "$HOME/.docker/init-zsh.sh" ]] && source "$HOME/.docker/init-zsh.sh"

# --- Conditional platform exports ---
case "$(uname -s)" in
Darwin)
  export DYLD_LIBRARY_PATH=/opt/homebrew/lib/
  export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib
  ;;
esac

eval "$(mise activate zsh)"
function _init_zoxide() {
  unfunction _init_zoxide
  eval "$(zoxide init zsh)"
}

# Auto-load them on demand (when you first use these commands)
autoload -Uz add-zsh-hook
add-zsh-hook precmd _init_zoxide

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
