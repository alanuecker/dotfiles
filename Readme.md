### Installation

#### Ubuntu

```shell
apt install zsh zsh-history-substring-search zsh-autosuggestions zsh-syntax-highlighting wget
```

#### macOs

```shell
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

```shell
brew install zsh zsh-history-substring-search zsh-autosuggestions zsh-syntax-highlighting wget
```

#### Install spaceship prompt

```shell
npm install -g spaceship-prompt
```

#### Install Hyper

Download

```
https://hyper.is/#installation
```

- install one of the [patched fonts](https://github.com/alanuecker/dotfiles/tree/master/shell/patched)
- add the font to `.hyper.js`
  - eg: `fontFamily`: `'"SourceCodePro+Powerline+Awesome Regular", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',`

#### Settings

- copy [`.zshrc`](https://github.com/alanuecker/dotfiles/blob/master/shell/.zshrc)
- add settings from `.bash_profile` or add `source ~/.bash_profile` at the end of the `.zshrc`
