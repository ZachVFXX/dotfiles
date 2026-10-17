# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export PATH="$HOME/.local/bin:$PATH"

dotgit() {
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}
