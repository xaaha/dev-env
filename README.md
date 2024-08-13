# Development Configurations

## Install Pre-requisite 

- Intall all the brew apps from `install.txt`

```bash
xargs brew install < install.txt
```

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

- **Jump**: To easily navigate between folders. After installation, put this in the `.zshrc`

```bash
eval "$(jump bash)"
```

- a [Nerd Font](https://www.nerdfonts.com/) **_(optional)_**

### Enable Alacritty
- Terminal: `brew install alacritty`
  - For mac, in the application folder, right click on the `alacritty` icon click Open & click Open again
- To change the theme you need to create a sym link to the file you want with the following command.

  - run and re-start alacritty

  ```bash
  # for light theme
  ln -s ~/.config/alacritty/themes/light.toml ~/.config/alacritty/themes/my_theme.toml

  # for dark theme
  ln -s ~/.config/alacritty/themes/dark.toml ~/.config/alacritty/themes/my_theme.toml
  ```

## Install

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
stow -t ~ config # to stow the config 
stow -t ~ wezterm # to stow the wezterm and so on 
stow -t ~ tmux
```

## Zshrc Alias

```.zshrc
# common commands
alias pn=pnpm
alias python=python3
alias pip=pip3
alias v="nvim"
alias lg=lazygit
alias ls=lsd

# common directories
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dc="cd ~/Documents"
alias pp="cd ~/Documents/Projects"
alias pf="fzf  --preview='less {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"
```

## Useful Steps for tools

- zshrc plugins

```.zshrc
plugins=(
 git
 zsh-autosuggestions
 zsh-syntax-highlighting
 )
```

- Amazon CodeWhisperer (Command line Utility). [Get here](https://aws.amazon.com/codewhisperer/resources/#Getting_started/)
- After Installation, run

```bash
cw integrations install input-method
```

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
