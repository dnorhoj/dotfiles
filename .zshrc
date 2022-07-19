#################
# Env variables #
#################

export ZSH="/home/dnorhoj/.oh-my-zsh"
export PATH="$PATH:/home/dnorhoj/scripts:/home/dnorhoj/.yarn/bin:/home/dnorhoj/.local/bin"

#############
# oh-my-zsh #
#############

ZSH_THEME="agnoster"

plugins=(
  git
  command-not-found
  sudo
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

#########
# ZPlug #
#########

source ~/.zplug/init.zsh

zplug zsh-users/zsh-syntax-highlighting
zplug dracula/zsh-syntax-highlighting
zplug DarrinTisdale/zsh-aliases-exa
zplug reegnz/jq-zsh-plugin # alt-j for jq
zplug g-plane/zsh-yarn-autocompletions
#zplug romkatv/powerlevel10k, as:theme, depth:1

zplug load

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

bindkey ^H backward-delete-word

source ~/.aliases

fortune theoffice | sed '2,$ s/^/\n/g' | cowsay -W$(($(tput cols)-4)) | lolcat
echo
