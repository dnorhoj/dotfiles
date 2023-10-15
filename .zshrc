#################
# Env variables #
#################

export ZSH="/home/dnorhoj/.oh-my-zsh"
export PATH="$PATH:/home/dnorhoj/scripts:/home/dnorhoj/.yarn/bin:/home/dnorhoj/.local/bin:/home/dnorhoj/.cargo/bin"
export WEB3_INFURA_PROJECT_ID=2e7332aeb0754e72a3ac2b59d28ac032
export LESS="-i -M -R -S -w -z-4"
export ZSH_ASK_API_KEY="<REDACTED>"

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
zplug b4b4r07/emoji-cli
zplug zsh-users/zsh-autosuggestions
zplug Licheam/zsh-ask
#zplug romkatv/powerlevel10k, as:theme, depth:1

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

########
# foot #
########

function osc7-pwd() {
    emulate -L zsh # also sets localoptions for us
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}

function chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || osc7-pwd
}
add-zsh-hook -Uz chpwd chpwd-osc7-pwd

##########
# Manual #
##########

bindkey ^H backward-delete-word
bindkey '^[[27;6;63~' run-help

source ~/.aliases

fortune theoffice | sed '2,$ s/^/\n/g' | cowsay -W$(($(tput cols)-4)) | lolcat
echo
