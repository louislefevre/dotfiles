#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\h: \W]\$ '

alias ls='ls --color=auto'
alias r='ranger'
alias cat='bat'
alias pacman='sudo pacman'
alias c='clear'

export PATH=$PATH:~/bin
