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

```bash
brew tap beeftornado/rmtree
brew rmtree <packagename>
```

- Enable fzf keybindings

```bash
# paste this and hit yes for all
$(brew --prefix)/opt/fzf/install
```

- Alacritty

- To change the theme you need to create a sym link to the file you want with the following command.

```bash
# for light theme
ln -s ~/.config/alacritty/themes/light.toml ~/.config/alacritty/themes/my_theme.toml
# for dark theme
ln -s ~/.config/alacritty/themes/dark.toml ~/.config/alacritty/themes/my_theme.toml
```

- By default, font smoothing causes fonts to be slightly bold in Alacritty.

```bash
# disble font smoothing
defaults -currentHost write -g AppleFontSmoothing -int 0
# reset font smoothing
defaults -currentHost delete -g AppleFontSmoothing
```

## Install

- Install Tree-sitter CLI for for treesitter, required since Tree-sitter moved to on main branch

```bash
npm install tree-sitter-cli
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

### Language Tools

- GoDoc: Go Standard library documentation offline

```bash
go install golang.org/x/tools/cmd/godoc@latest
```

Add this to the `.zshrc` file

```bash
export PATH=$PATH:$(go env GOPATH)/bin
```

Source and reload the zsh config

```bash
source .zshrc
```

Then, run with

```bash
godoc -http=:6060
```

Lastly on the browser

```bash
http://localhost:6060/
```

### Mac Notes

```bash
# change quit unexpectedly popup to a notification
defaults write com.apple.CrashReporter UseUNC 1
```
