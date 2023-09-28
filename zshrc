# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="kphoen"
ZSH_THEME='candy'

# ZSH_THEME="gozilla"
# ZSH_THEME="nebirhos" # rvm
# ZSH_THEME="sunaku"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
# zsh-syntax-highlighting
zsh-completions
zsh-autosuggestions
F-Sy-H

jsontools
encode64

# git tools
git
git-extras
# git-open

mercurial
svn

# python tools
python
pip

# node tools
node
npm
nvm
ng # angular
yarn

# go tools
golang

rust
ripgrep

# tools
extract
urltools
tmux
docker
docker-compose
debian
nmap
autojump

kubectl

# haskell tools
# cabal

# ruby tools
# rake
# ruby
# rails
# gem
# rvm

# scala tools
# sbt
# scala
)

source $ZSH/oh-my-zsh.sh

umask 022

if ! [ -z $SSH_CLIENT ]; then
    PS1="(ssh)${PS1}"
fi

# Customize to your needs...

# source $ZSH/custom/incr*.zsh
# source $ZSH/incr*.zsh

if [[ -s '/etc/zsh_command_not_found' ]]; then
	source '/etc/zsh_command_not_found'
fi

[ -f /usr/share/zsh/vendor-completions/ ] && fpath=(/usr/share/zsh/vendor-completions/ $fpath)

source $USER_DOTFILE_PATH/shell/shellrc
export fpath=($fpath $USER_DOTFILE_PATH/shell/zsh/completions)

export ADBLOCK=true
export DISABLE_OPENCOLLECTIVE=true

# echo USE_PURE_PROMPT $USE_PURE_PROMPT
if [[ $USE_PURE_PROMPT = "true" ]]; then
    # echo USE_PURE_PROMPT
    autoload -U promptinit; promptinit
    prompt pure
fi

# echo USE_BAT_FOR_MANPAGE $USE_BAT_FOR_MANPAGE
if [ $USE_BAT_FOR_MANPAGE = "true" ]; then
    # echo set MANPAGER
    # use bat to do syntax highlight
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi
