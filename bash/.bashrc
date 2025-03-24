# Amazon Q pre block. Keep at the top of this file.
# [[ -f "${HOME}/Library/Application Support/amazon-q/shell/bashrc.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bashrc.pre.bash"
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# keep it minimal
eval "$(mise activate bash)"
{
  eval "$(jump shell)"
}&> /dev/null

export EDITOR="nvim"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

export PS1="\W \$ "

# go path for go install <module>
export GOPATH=$HOME/go
export PATH=$PATH:$(go env GOPATH)/bin

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# # pnpm end

# Amazon Q post block. Keep at the bottom of this file.
# [[ -f "${HOME}/Library/Application Support/amazon-q/shell/bashrc.post.bash" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/bashrc.post.bash"
