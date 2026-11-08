[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ls='ls -o -A -g -h --color=auto -p -q'
PS1='[\u@\h \W]\$ '

export PATH="$HOME/.local/bin:$PATH"
. "$HOME/.cargo/env"
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$HOME/.zvm/bin:$ZVM_INSTALL:$PATH"

dotfile() {
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}
