# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export PATH="$HOME/.local/bin:$PATH"

dotfile() {
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}

update_package() {
    xbps-query -m > ~/.void_packages
}

install() {
    sudo xbps-install -S
}

remove() {
    sudo xbps-remove -ROOo 
}

update() {
    sudo xbps-install -Su && update_package
}

query() {
    xbps-query -Rs
}
