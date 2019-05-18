## Oh My Zsh
### Installation
#### Ubuntu
```shell
apt install zsh wget
```
#### macOs
```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
```shell
brew install zsh zsh-completions wget
```
#### Download Oh My Zsh
```shell
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```
#### Install Powerlevel9k
```shell
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```
- install one of the [patched fonts](https://github.com/alanuecker/dotfiles/tree/master/shell/patched)
- select the installed font in the terminal manager
  - iTerm2: `Preferences --> Profiles --> Text --> Change Font`
#### Settings
- copy [`.zshrc`](https://github.com/alanuecker/dotfiles/blob/master/shell/.zshrc)
- add settings from `.bash_profile` or add `source ~/.bash_profile` at the end of the `.zshrc`
