#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias pacman='pacman --color=auto'
alias clock='tty-clock -xcs -C 6'

PS1='[\u@\h \W]\$ '

