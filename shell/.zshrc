# If you come from bash you might have to change your $PATH.

# export PATH=$HOME/bin:/usr/local/bin:$PATH

# autoload some stuff
autoload -Uz compinit
compinit

autoload -U promptinit
promptinit

# load the theme
prompt spaceship

# theme settings
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# better history
HISTFILE=~/.zsh_history     #Where to save history to disk
HISTSIZE=50000               #How many lines of history to keep in memory
SAVEHIST=10000               #Number of history entries to save to disk
## history command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

# zsh better history search (optional)
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# alias
alias adb='~/Library/Android/sdk/platform-tools/adb'
alias localdb='docker-compose exec mongodb mongo localhost/rise'
alias editzsh='vim ~/.zshrc'
alias localrec='docker exec -ti localdev_licode_erizo_agent_1 /bin/bash'
alias localdev='cd ~/Documents/deployments/local_dev'
alias rise='cd ~/Documents/rise/app'
alias dockerdownandup='docker-compose down; ./init.sh; docker-compose up -d'
alias mni='meteor npm i'
alias gsu='git submodule update --init --recursive'
# force docker to rebuild container
dcrs () { docker-compose stop "$@" && docker-compose rm -f "$@" && docker-compose build --no-cache "$@" && docker-compose up -d }

#rise bash profile
#android
export ANDROID_HOME=~/Library/Android/sdk/
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# <--- add env here

source ~/.bash_profile

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/alan/.sdkman"
[[ -s "/Users/alan/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/alan/.sdkman/bin/sdkman-init.sh"

source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
