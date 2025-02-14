#################
# Env variables #
#################

export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/scripts:$HOME/.local/bin:$HOME/.cargo/bin"

#############
# oh-my-zsh #
#############

export AGNOSTER_CONTEXT_FG="default"
export AGNOSTER_STATUS_FG="default"
ZSH_THEME="agnoster"

plugins=(
  git
  sudo
  colored-man-pages
  grc
)

source $ZSH/oh-my-zsh.sh

#########
# ZPlug #
#########

source ~/.zplug/init.zsh

zplug zsh-users/zsh-syntax-highlighting
zplug dracula/zsh-syntax-highlighting
zplug DarrinTisdale/zsh-aliases-exa
zplug zsh-users/zsh-autosuggestions

zplug load

##############
# git extras #
##############

source /usr/share/doc/git-extras/git-extras-completion.zsh

#######
# fzf #
#######

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

##########
# zoxide #
##########

eval "$(zoxide init zsh)"

##########
# Manual #
##########

source ~/.aliases

