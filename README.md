# Development Configurations

## Pre-requisite

- Install ripgrep `brew install ripgrep`
  - Need this for telescope grep
- Install Trash `brew install trash`
  - To avoid error "trash.cmd" is not executable in nvim-tree
- Install fd. `brew install fd`
  - venv selector needs fd to find the venv folder.
- Git obviously
- a [Nerd Font](https://www.nerdfonts.com/) **_(optional)_**

## Install

- Backup Neovim Files

```shell
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

- Clone the repo

Make sure to clone & spread the repo inside the .config folder

```shell
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
alias rrr="clear"
alias python=python3
alias v="nvim"

# navigation
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."

# common directories
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dc="cd ~/Documents"
alias pp="cd ~/Documents/Projects"
alias home="cd ~"

#Git
alias gs="git status"
```

## Useful Tools

- Jump: To easily navigate between folders

```shell
brew install jump
```

After installation, put this in the `.zshrc`

```shell
eval "$(jump shell)"
```

- zshrc plugins

```.zshrc
plugins=(
 git
 zsh-autosuggestions
 zsh-syntax-highlighting
 )
```
