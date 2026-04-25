#!/usr/bin/env zsh

# Docker init (optional)
[[ -f "$HOME/.docker/init-zsh.sh" ]] && source "$HOME/.docker/init-zsh.sh"

# --- Conditional platform exports ---
case "$(uname -s)" in
Darwin)
  export DYLD_LIBRARY_PATH=/opt/homebrew/lib/
  export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib
  ;;
esac

# --- Cache slow eval outputs ---
# Invalidates when the binary is updated (brew upgrade, mise self-update, etc.)
# Force refresh: rm ~/.cache/zsh/*.zsh
() {
  local cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
  [[ -d "$cache_dir" ]] || mkdir -p "$cache_dir"

  local -A tools=(
    [mise]="mise activate zsh"
    [starship]="starship init zsh"
    [zoxide]="zoxide init zsh"
  )

  local name cmd bin cache
  for name cmd in "${(@kv)tools}"; do
    bin="${commands[$name]}"
    [[ -z "$bin" ]] && continue
    cache="$cache_dir/$name.zsh"
    if [[ ! -f "$cache" || "$bin" -nt "$cache" ]]; then
      eval "$cmd" > "$cache"
      zcompile "$cache"
    fi
    source "$cache" 2>/dev/null
  done
}

# --- FZF setup ---
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

if [[ -r "/opt/homebrew/opt/fzf/shell/completion.zsh" ]]; then
  source /opt/homebrew/opt/fzf/shell/completion.zsh
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
elif [[ -r "/usr/share/fzf/completion.zsh" ]]; then
  source /usr/share/fzf/completion.zsh
  source /usr/share/fzf/key-bindings.zsh
fi
