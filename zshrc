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

if [[ $USE_PROMPT = "p10k" ]]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

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

fzf-tab

pnpm-shell-completion

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

[ -f /usr/share/zsh/vendor-completions/ ] && fpath=(/usr/share/zsh/vendor-completions/ $fpath)
fpath+=$USER_DOTFILE_PATH/shell/zsh/completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

umask 022

if ! [ -z $SSH_CLIENT ]; then
  PS1="(ssh)${PS1}"
fi

# Customize to your needs...

if [[ -s '/etc/zsh_command_not_found' ]]; then
  source '/etc/zsh_command_not_found'
fi

source $USER_DOTFILE_PATH/shell/shellrc
source ${USER_DOTFILE_PATH}/shell/zsh/env

[ -f $HOME/.cargo/env ] && source "$HOME/.cargo/env"

if which fnm >& /dev/null; then
  eval "$(fnm env --use-on-cd)"
  # override default FNM_NODE_DIST
  export FNM_NODE_DIST=https://npmmirror.com/mirrors/node
  rehash
fi

[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh && alias fzf-preview='fzf --preview "fzf-preview.sh {}"' && compdef _gnu_generic fzf

