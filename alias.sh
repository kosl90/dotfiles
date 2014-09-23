unalias ag
unalias di

# general
alias 关机='sudo poweroff'
alias hub=$HOME/src/tools/hub

alias synapse='(synapse -s &)'
alias ping='ping -c5'
alias t='tmux -2u'
alias tmux='tmux -2u'

alias god="cd $(grep 'XDG_DESKTOP_' $HOME/.config/user-dirs.dirs | cut -d= -f2)"
alias gor='cd /run/shm'
alias got='cd /tmp'

alias pyHTTPServ='python -m SimpleHTTPServer'
alias wiki="cd $MYWIKI && gitit &; cd - "
alias python2=python2.7
alias clr='rm -rf *.o a.out *.exe'

alias dp='xdg-open'
alias owd="xdg-open ."

alias psa="ps -ef"
# alias kill="kill -9"
# alias kall='killall -9'

alias goagent="python $GOAGENT_PATH/local/proxy.py"
alias goagent3="python3 $GOAGENT_PATH/local/proxy.py"

alias code_name='lsb_release -cs'
alias release_version='lsb_release -rs'


# alias for ls
alias ls="ls -F --color=auto"
alias l=ls
alias lls=ls
alias ll="ls -Flh --color=auto"


# alias for make
alias mc='make clean'
alias mr='make run'
alias mk="make -j$(($(grep processor /proc/cpuinfo | wc -l) + 1))"
alias mdc='make distclean'
alias mkd='make dist'


#alias for ipython
# alias ipy='ipython'
# alias ipyq='ipython qtconsole'
# alias ipyn='ipython notebook'
# alias pylab='ipython --pylab'
# alias pylabq='ipython --pylab=qt'


# alias for ipython3
# alias ipy3='ipython3'
# alias ipyq3='ipython3 qtconsole'
# alias ipyn3='ipython3 notebook'
# alias pylab3='ipython3 --pylab'
# alias pylabq3='ipython3 --pylab=qt'


# alias for vim
alias vim='vim -p'
alias vi=vim

# alias for emacs
if which emacs24 > /dev/null
then
    alias em="emacs24 -nw"
else
    alias em="emacs -nw"
fi


# alias for Qt
alias qp="qmake -project"
alias qm="qmake"

alias qp5="$QT5PATH/bin/qmake -project"
alias qm5="$QT5PATH/bin/qmake -makefile"


# alias for scons
alias sc="scons -Q"
alias scc="scons -c"


# alias man='vman'
# alias man='cman'


# alias for git
alias glg="git log --graph --decorate"
alias glo="git log --oneline --graph --decorate"
alias gdf="git diff"
alias gdc="git diff --cached"
alias gdl='git difftool'
alias gst="git status -sb"
alias gdw="git diff --word-diff"


# alias for ack
if which ack-grep > /dev/null
then
    alias ack="ack-grep"
    alias ackp='ack-grep --pager=less'
else if which ack > /dev/null
    alias ackp='ack --pager=less'
fi

alias sin="dbus-send --dest=com.deepin.dde.dock --print-reply --type=method_call /com/deepin/dde/dock com.deepin.dde.dock.ShowInspector"
