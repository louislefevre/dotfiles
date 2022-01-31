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
alias paccount='pacman -Q | wc -l'
alias monitor='bpytop'
alias zip='7z'
alias vim='nvim'
alias updates='checkupdates; yay -Qu'

export EDITOR=nvim
export VISUAL=nvim
export PATH=$PATH:~/bin
export GPG_TTY=$(tty)
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

gpgconf --launch gpg-agent


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
