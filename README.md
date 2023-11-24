# Development Configurations

## Pre-requisite

- Install ripgrep `brew install ripgrep`
  - Need this for telescope grep
- Install Trash `brew install trash`
  - To avoid error "trash.cmd" is not executable in nvim-tree
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
