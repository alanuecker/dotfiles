# If you come from bash you might have to change your $PATH.

# export PATH=/usr/local/bin:$PATH

# autoload some stuff
autoload -Uz compinit
compinit

# load the theme
source /usr/local/opt/spaceship/spaceship.zsh

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
# alias adb='~/Library/Android/sdk/platform-tools/adb'
alias editzsh='nvim ~/.zshrc'

# clean branches
gclb() {
  git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D;
}

# create tag and push to origin
gtpo() { 
  git tag $1 && git push origin $1;
}

# pick all commits between A (oldest) and B (newest)
gcpr() {
  git cherry-pick $1^..$2;
}

# rename a tag and push to remote
gtr() {
  git tag $1 $2;
  git tag -d $2;
  git push origin $1 :$2;
}

# fuzzy search
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# ENHANCD settings 
export ENHANCD_FILTER=fzy
export ENHANCD_DISABLE_DOT=1

# Change the default git editor to nvim
export GIT_EDITOR=nvim

export PATH=/bin:/usr/bin:/usr/local/bin:${PATH}
export PATH=$HOME/.local/bin:${PATH}

#android
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
# avdmanager, sdkmanager
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin

# adb, logcat
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator

# ruby
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init - zsh)"

source ~/.bash_profile

source ~/enhancd/init.sh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/git.zsh
source ~/.config/zsh/git.plugin.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alanuecker/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/alanuecker/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/alanuecker/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/alanuecker/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# alias python=/usr/bin/python3
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
