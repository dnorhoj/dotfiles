 export ZSH="/home/dnorhoj/.oh-my-zsh"
 ZSH_THEME="agnoster"

eval $(thefuck --alias)

plugins=(
  git
  command-not-found
  sudo
  zsh-syntax-highlighting
  zsh-aliases-exa
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh


# Manual
source ~/.aliases
