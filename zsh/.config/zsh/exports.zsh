#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=2000
SAVEHIST=2000
export EDITOR="nvim"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

# mise: tool version management
eval "$(mise activate zsh)"

# go path for go install <module>
export GOPATH=$HOME/go
export PATH=$PATH:$(go env GOPATH)/bin

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun" # bun completions
# bun end

eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# zoxide & Jump
eval "$(zoxide init zsh)"
eval "$(jump shell)" 

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

# modified docker command 
if [ -f "$HOME/.docker/init-zsh.sh" ]; then
  source $HOME/.docker/init-zsh.sh
fi

# export PATH="$HOME/.docker/bin":$PATH

case "$(uname -s)" in

Darwin)
	# echo 'Mac OS X'
  export DYLD_LIBRARY_PATH=/opt/homebrew/lib/
  export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib
	;;

Linux)
	;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
	# echo 'MS Windows'
	;;
*)
	# echo 'Other OS'
	;;
esac
