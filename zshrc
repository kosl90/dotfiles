# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kphoen"
# ZSH_THEME='intheloop'
# ZSH_THEME='juanghurtado'
# ZSH_THEME='candy'

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
plugins=(git git-extras extract pip urltools vundle python debian npm mercurial node)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export SRC=$HOME/src
export TOOLS=$SRC/tools
export MYWIKI=$HOME/mywiki
export WIKIDATA=$MYWIKI/wikidata
export DESK=$(grep -i 'desktop' $HOME/.config/user-dirs.dirs | cut -d= -f2)
export NOTES=$HOME/Dropbox/notes

export EDITOR=vim
export GAE_PATH=$HOME/GAE
export GOAGENT_PATH=$GAE_PATH/goagent

alias pyHTTPServ='python -m SimpleHTTPServer'
alias wiki="cd $MYWIKI && gitit &; cd - "
alias python2=python2.7
alias clr='rm -rf *.o a.out *.exe'

# alias for make
alias mc='make clean'
alias mr='make run'
alias mk='make -j12'
alias mdc='make distclean'
alias mkd='make dist'

#alias for ipython
alias ipy='ipython'
alias ipyq='ipython qtconsole'
alias ipyn='ipython notebook'
alias pylab='ipython --pylab'
alias pylabq='ipython --pylab=qt'

# alias for ipython3
alias ipy3='ipython3'
alias ipyq3='ipython3 qtconsole'
alias ipyn3='ipython3 notebook'
alias pylab3='ipython3 --pylab'
alias pylabq3='ipython3 --pylab=qt'

alias dp='xdg-open'
alias ls="ls -F --color=auto"
alias l=ls
alias lls=ls
alias ll="ls -Flh --color=auto"
alias psa="ps -ef"
alias code_name='lsb_release -cs'
alias release_version='lsb_release -rs'
alias kill="kill -9"
alias kall='killall -9'
alias owd='xdg-open $(pwd)'
alias goagent="python $GOAGENT_PATH/local/proxy.py"
alias goagent3="python3 $GOAGENT_PATH/local/proxy.py"

# alias for editor
if which emacs24 > /dev/null
then
    alias em="emacs24 -nw"
else
    alias em="emacs -nw"
fi

# alias for Qt
alias qp="qmake -project"
alias qm="qmake"
alias qms="qmake -spec"
alias qmc="qmake -spec unsupported/linux-clang"
# QT5PATH="/usr/local/Qt-5.0.2/"
QT5PATH="/opt/Qt5.1.0/5.1.0/gcc/"
alias qp5="$QT5PATH/bin/qmake -project"
alias qm5="$QT5PATH/bin/qmake -makefile"

# alias for scons
alias sc="scons -Q"
alias scc="scons -c"

# alias for vim
alias vim='vim -p'
alias vi=vim

#alias time="/usr/bin/time -p"

cman() {
        env \
                LESS_TERMCAP_mb=$(printf "\e[1;31m") \
                LESS_TERMCAP_md=$(printf "\e[1;31m") \
                LESS_TERMCAP_me=$(printf "\e[0m") \
                LESS_TERMCAP_se=$(printf "\e[0m") \
                LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
                LESS_TERMCAP_ue=$(printf "\e[0m") \
                LESS_TERMCAP_us=$(printf "\e[1;32m") \
                        man "$@"
}


vman() {
    /usr/bin/whatis $@ > /dev/null

    if [ $? -eq 0 ]; then
        /usr/bin/vim -c "Man $@" -c "silent! only" -c "nmap q :q<cr>"
    else
        /usr/bin/man "$@"
    fi
}

# alias man='vman'
# alias man='cman'

# alias for git
alias glg="git log --graph --decorate"
alias glo="git log --oneline --graph --decorate"
alias gdf="git diff"
alias gdc="git diff --cached"
alias gst="git status -sb"
alias gdw="git diff --word-diff"

function gcd() {
    if [ "$(git rev-parse --show-toplevel)" != "" ]
    then
        if [ "$1" != "" ]
        then
            cd "$(git rev-parse --show-toplevel)/$1"
        else
            cd $(git rev-parse --show-toplevel)
        fi
    fi
}

# source $ZSH/custom/incr*.zsh
# source $ZSH/incr*.zsh
# export http_proxy="http://localhost:8087"
alias gdk="cd $DESK"
alias 关机='sudo poweroff'
alias hub=~/src/tools/hub
if which ack-grep > /dev/null
then
    alias ack="ack-grep"
fi

ulimit -c 1024000
if [ ! -d "/tmp/core_files" ]
then
    mkdir /tmp/core_files
fi

alias ddetray="(python /usr/share/deepin-system-tray/src/trayicon.py &)"
alias synapse='(synapse -s &)'
export WEBKIT_INSPECTOR_PATH=$HOME/webinspector/
alias restartcompiz="(compiz --replaec&)"

alias ping='ping -c3'
alias tmux='tmux -2u'

export DISPLAY=:0

export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
export PATH=$PATH:$TOOLS/apache-maven/bin:$HOME/.cabal/bin:/usr/local/go/bin:$HOME/src/scripts
export PATH=$PATH:/opt/QtSDK/Desktop/Qt/4.8.1/gcc/bin:/opt/QtSDK/QtCreator/bin:/usr/local/sml/bin
export PATH=$PATH:$GAE_PATH:$HOME/node_modules/.bin/:$QT5PATH/bin/
