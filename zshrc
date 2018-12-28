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
zsh_reload git git-extras extract urltools vundle python
debian npm mercurial node rvm svn tmux go rake ruby gem
cabal pip docker sbt scala nmap autojump rails nvm
zsh-syntax-highlighting zsh-completions zsh-autosuggestions
git-open ng
)

source $ZSH/oh-my-zsh.sh

umask 022

# Customize to your needs...

# source $ZSH/custom/incr*.zsh
# source $ZSH/incr*.zsh

if [[ -s '/etc/zsh_command_not_found' ]]; then
	source '/etc/zsh_command_not_found'
fi

[ -f /usr/share/zsh/vendor-completions/ ] && fpath=(/usr/share/zsh/vendor-completions/ $fpath)

export CONF_PATH=$HOME/.dotfiles
source $CONF_PATH/shell/shellrc
