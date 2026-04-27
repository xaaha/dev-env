# Zsh Setup

## Structure

```
.zshrc                      → entry point (history, plugins, keybinds)
.config/zsh/exports.zsh     → PATH, env vars, tool init (mise, starship, zoxide, fzf)
.config/zsh/functions.zsh   → shell functions
.config/zsh/secrets.zsh     → tokens/keys (not committed)
```

Plugins live in `~/.local/share/zsh/plugins/` (managed manually, no plugin manager).

## How it works

Startup is split into eager and deferred loading for speed (~20ms):

- **Eager** (before first prompt): PATH via mise shims, zoxide, fzf key-bindings, autosuggestions
- **Deferred** (after first prompt via precmd): mise activate, starship, compinit, fzf-tab, autopair, syntax-highlighting

Tool init scripts (mise, starship, zoxide) are cached in `~/.cache/zsh/`. Cache auto-invalidates when the binary is updated (e.g., `brew upgrade`).

## Common tasks

### Refresh cache after config changes

If you change `starship.toml`, `mise` config, etc. the cache won't pick it up automatically (it only watches binary mtime). Run:

```sh
zsh-refresh
```

### Add a plugin

```sh
git clone https://github.com/<user>/<plugin>.git ~/.local/share/zsh/plugins/<plugin>
# example
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.local/share/zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/hlissner/zsh-autopair ~/.local/share/zsh/plugins/zsh-autopair
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.local/share/zsh/plugins/zsh-autosuggestions
git clone https://github.com/aloxaf/fzf-tab ~/.local/share/zsh/plugins/fzf-tab
```

Then add a `source` line in `.zshrc`:

- If cheap/needed immediately: add to the eager section (before `_defer_plugins`)
- If heavier or completion-related: add inside `_defer_plugins()`

Syntax highlighting must always be sourced last.

### Update a plugin

```sh
git -C ~/.local/share/zsh/plugins/<plugin> pull
```

Or update all:

```sh
for d in ~/.local/share/zsh/plugins/*/; do git -C "$d" pull; done
```

### Remove a plugin

1. Delete the `source` line from `.zshrc`
2. `rm -rf ~/.local/share/zsh/plugins/<plugin>`

### Current plugins

| Plugin                  | Section                 | Purpose                    |
| ----------------------- | ----------------------- | -------------------------- |
| zsh-autosuggestions     | eager                   | fish-like suggestions      |
| zsh-autopair            | deferred                | auto-close brackets/quotes |
| fzf-tab                 | deferred                | fzf-powered tab completion |
| zsh-syntax-highlighting | deferred (must be last) | command highlighting       |
