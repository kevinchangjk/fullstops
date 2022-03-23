#! /bin/zsh 

# key variables
export REPOS="$HOME/ripples"
export ZSH_DOTS="$REPOS/zsh"

# zsh automagic completion
autoload -U compinit
compinit

function setup() {
  sourceDirs=()
  sourceDirs+=(core brew)
  for d in $sourceDirs[@]; do
    fs=($(find $ZSH_DOTS/$d -type f))
    for f in $fs[@]; do source "$f"; done
  done
}

setup
# printf '\033[2J\033[3J\033[1;1H' # clears screen
clear -x
py "$ZSH_DOTS/quote/quotes.py"
