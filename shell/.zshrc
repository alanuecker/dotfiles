# If you come from bash you might have to change your $PATH.

# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Powerline
POWERLEVEL9K_MODE='awesome-patched'
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2 # number of displayed folder names
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir) # change left side
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs status) # change right side
POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_BACKGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="white"

source $ZSH/oh-my-zsh.sh

# zsh plugins

# zsh better history search (optional)
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# command prediction (optional)
autoload predict-on
predict-toggle() {
  ((predict_on=1-predict_on)) && predict-on || predict-off
}
zle -N predict-toggle
bindkey '^Z' predict-toggle
zstyle ':predict' toggle true
zstyle ':predict' verbose true

# save ssh key passwords
zstyle :omz:plugins:ssh-agent agent-forwarding on

plugins=(git ssh-agent docker zsh-syntax-highlighting)

# alias
alias adb='~/Library/Android/sdk/platform-tools/adb'
alias localdb='docker-compose exec mongodb mongo localhost/rise'
alias editzsh='vim ~/.zshrc'
alias localdev='cd ~/Documents/deployments/local_dev'
alias rise='cd ~/Documents/rise/app'
alias dockerdownandup='docker-compose down; ./init.sh; docker-compose up -d'

#rise bash profile
#android (could be optional)
export ANDROID_HOME=~/Library/Android/sdk/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export PUBLIC_IP=127.0.0.1 # <-- set correct ip
export PUBLIC_HOSTNAME=$(hostname)
export ROOT_URL=https://$(hostname)

# <-- add env settings here
