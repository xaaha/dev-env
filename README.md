# Development Configurations

## List of All Apps that needs

```text
ripgrep
trash
fzf
fd
jq
jump
nightfall
scroll-reverser
rectangle
dozer
sd
alacritty
wezterm
lsd
notunes
```

- Copy items in a text file, one item per line, and then run
- Install the rmtree to remove formulae and all dependencies

```bash
brew tap beeftornado/rmtree
brew rmtree <packagename>
```

```bash
xargs brew install < apps.txt
```

## Pre-requisite

- Install ripgrep `brew install ripgrep`
  - Need this for telescope grep
- Install Trash `brew install trash`
  - To avoid error "trash.cmd" is not executable in nvim-tree
- Install fd. `brew install fd`
  - venv selector needs fd to find the venv folder.
- jq: Command Line Json processor

```bash
brew install jq
```

- Git
- a [Nerd Font](https://www.nerdfonts.com/) **_(optional)_**
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

Make sure to clone & spread the repo inside the .config folder

```bash
cd ~/.config # navigate to .config folder
git init  # initialize it as a git repo
git remote add origin git@github.com:xaaha/dev-env.git #  https://www.github.com/xaaha/dev-env
git fetch
git checkout -t origin/main
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

## Useful Tools

- Jump: To easily navigate between folders

```bash
brew install jump
```

After installation, put this in the `.zshrc`

```bash
eval "$(jump bash)"
```

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

- Nightfall: To easily switch between dark and light mode

```bash
brew install nightfall
```

- [Scroll Reverser](https://pilotmoon.com/scrollreverser/): To make using mouse and mouse pad natural

- Rectangle: Window Management

```bash
brew install --cask rectangle
```

- Dozer: To sweep up all the items in the menu bar

```bash
brew install --cask dozer
```

- sd: Search and Displace

```bash
brew install sd
```
