# Development Configurations

Minimal Personal Development Environment.

![Preview](https://github.com/xaaha/dev-env/blob/main/Preview.png)

## Install

> [!Note]
> Script installs all apps from `Brewfile`. Primarily for new Mac setup

```bash
curl -s https://raw.githubusercontent.com/xaaha/dev-env/refs/heads/main/install.sh | bash
```

- Checks and instals if `xcode-select` is not available
- Installs [zap](https://github.com/zap-zsh/zap)
- Installs TPM for tmux from [the official repo](https://github.com/tmux-plugins/tpm).
  - Install with: `prefix I`
  - Uninstall with: `prefix alt u` (option in MacOs)
  - Upgrade packages: `prefix U`
- Enables fzf keybindings

```bash
# paste this and hit yes for all
$(brew --prefix)/opt/fzf/install
```

## Configure Nvim

- Backup Neovim Files (if it exists)

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

# pick which dir to stow with
for dir in zsh yazi; do stow -t ~ "$dir"; done

# OR stow one at a time
stow -t ~ config # to stow the config
stow -t ~ wezterm # to stow the wezterm and so on
stow -t ~ tmux
```

## Useful Steps for tools

Collection of random items

<details>
  <summary>Click to Expand</summary>
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

### Vimium Mapping for Vertical Tab

```bash
map K previousTab
map J nextTab
```

</details>
