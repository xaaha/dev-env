#!/usr/bin/env zsh

# --- Conditional platform exports ---
case "$(uname -s)" in
Darwin)
  export DYLD_LIBRARY_PATH=/opt/homebrew/lib/
  export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib
  ;;
esac

# --- Cache helper ---
# Caches eval output; invalidates when the binary is updated.
# Force refresh: rm ~/.cache/zsh/*.zsh
_zsh_cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
[[ -d "$_zsh_cache_dir" ]] || mkdir -p "$_zsh_cache_dir"

_cache_eval() {
  local name=$1 cmd=$2 bin="${commands[$1]}"
  [[ -z "$bin" ]] && return 1
  local cache="$_zsh_cache_dir/$name.zsh"
  local conf="${XDG_CONFIG_HOME:-$HOME/.config}/$name/config.toml"
  if [[ ! -f "$cache" || "$bin" -nt "$cache" || ( -f "$conf" && "$conf" -nt "$cache" ) ]]; then
    eval "$cmd" > "$cache"
    zcompile "$cache"
  fi
}

# --- Eager: only what's needed before first prompt ---
# mise: use shims for instant PATH, defer full activate to after first prompt
export PATH="$HOME/.local/share/mise/shims:$PATH"

# zoxide — tiny, load now
_cache_eval zoxide "zoxide init zsh" && source "$_zsh_cache_dir/zoxide.zsh" 2>/dev/null

# fzf — add to PATH and source key-bindings directly (skip fzf --zsh fork)
[[ "$PATH" != */opt/homebrew/opt/fzf/bin* ]] && PATH="${PATH}:/opt/homebrew/opt/fzf/bin"
if [[ -r "/opt/homebrew/opt/fzf/shell/key-bindings.zsh" ]]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
elif [[ -r "/usr/share/fzf/key-bindings.zsh" ]]; then
  source /usr/share/fzf/key-bindings.zsh
fi

# --- Deferred: load after first prompt renders ---
_defer_init() {
  add-zsh-hook -d precmd _defer_init
  unfunction _defer_init

  # mise activate (replaces shims with proper env hook)
  _cache_eval mise "mise activate zsh" && source "$_zsh_cache_dir/mise.zsh" 2>/dev/null

  # starship prompt
  _cache_eval starship "starship init zsh" && source "$_zsh_cache_dir/starship.zsh" 2>/dev/null

  # fzf completion (only matters on first tab)
  if [[ -r "/opt/homebrew/opt/fzf/shell/completion.zsh" ]]; then
    source /opt/homebrew/opt/fzf/shell/completion.zsh
  elif [[ -r "/usr/share/fzf/completion.zsh" ]]; then
    source /usr/share/fzf/completion.zsh
  fi

  # docker init
  [[ -f "$HOME/.docker/init-zsh.sh" ]] && source "$HOME/.docker/init-zsh.sh"

  unfunction _cache_eval
  unset _zsh_cache_dir
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _defer_init
