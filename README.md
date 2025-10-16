# Development Configurations

## Install Pre-requisite

- Install [zap](https://github.com/zap-zsh/zap)
- Install all apps with curl

```bash
curl -s https://raw.githubusercontent.com/xaaha/dev-env/refs/heads/main/install.sh | bash
```

> Intalls all apps from `install.txt` file. Just run the command again if an application fails to install

- Install tpm for tmux from [the official repo](https://github.com/tmux-plugins/tpm).
  - Install with: `prefix I`
  - Uninstall with: `prefix alt u` (option in MacOs)
  - Upgrade packages: `prefix U`

- Install the rmtree to remove formulae and all their dependencies

- Enable fzf keybindings

```bash
# paste this and hit yes for all
$(brew --prefix)/opt/fzf/install
```

## Install

- Install Tree-sitter CLI, required since Tree-sitter moved to on main branch

> [!Note]
> I have found it's just easier overhead to install npm packages with node itself. Look into `.default-npm-packages`

```bash
pnpm install tree-sitter-cli
```

- Backup Neovim Files

```bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

- Clone the repo

```bash
git clone git@github.com:xaaha/dev-env.git #  https://www.github.com/xaaha/dev-env
```

- Stow all the folder you need with

```bash
# stow all at once
for dir in $(pwd)/*/; do stow -t ~ $(basename "$dir"); done
```

```bash
# stow one at a time
stow -t ~ config # to stow the config
stow -t ~ wezterm # to stow the wezterm and so on
stow -t ~ tmux
```

## Useful Steps for tools

### Mac Settings

```bash
# change quit unexpectedly popup to a notification
defaults write com.apple.CrashReporter UseUNC 1
```

- By default, font smoothing causes fonts to be slightly bold in Alacritty.

```bash
# disble font smoothing
defaults -currentHost write -g AppleFontSmoothing -int 0
# reset font smoothing
defaults -currentHost delete -g AppleFontSmoothing
```

### Arch Settings

Until I have time to consolidate stuff

#### Keymap Settings

```bash
# GNOME
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
# to reset this
gsettings reset org.gnome.desktop.input-sources xkb-options
```

### Git Global Ignore

```bash
git config --global core.excludesfile "~/.gitignore_global"
```
