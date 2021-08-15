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
alias pacorphans='pacman -Qtdq | pacman -Rns -'
alias monitor='bpytop'
alias zip='7z'
alias vim='nvim'

export EDITOR=nvim
export VISUAL=nvim
export PATH=$PATH:~/bin

