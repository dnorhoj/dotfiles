export ZSH="/home/dnorhoj/.oh-my-zsh"

ZSH_THEME="agnoster"

# TheFuck
eval $(thefuck --alias)

plugins=(
  git
  command-not-found
  sudo
  zsh-syntax-highlighting
  zsh-aliases-exa
)

source $ZSH/oh-my-zsh.sh

# User configuration

PATH=/home/dnorhoj/scripts:$PATH
source ~/.aliases
