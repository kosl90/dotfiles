# this is from debian plugin for upgrade,
# unalias ag to make silversearcher-ag work.
if alias ag >& /dev/null
then
    unalias ag
fi

# this is from debian plugin for dpkg -i,
# unalias di to make di(a advanced disk information utility) work.
if alias di >& /dev/null
then
    unalias di
fi

# general
alias 关机='sudo poweroff'
alias hub=$HOME/src/tools/hub

alias synapse='(synapse -s &)'
alias ping='ping -c5'
alias t='tmux -2u'
alias tmux='tmux -2u'
alias s=startx

if [ -f $HOME/.config/user-dirs.dirs ]; then
    alias god="cd $(grep 'XDG_DESKTOP_' $HOME/.config/user-dirs.dirs | cut -d= -f2)"
fi
alias gor='cd /run/shm'
alias got='cd /tmp'

alias py2HTTPServ='python2 -m SimpleHTTPServer'
alias py3HTTPServ='python3 -m http.server'
alias python2=python2.7
alias clr='rm -rf *.o a.out *.exe'

alias dp='xdg-open'
alias owd="xdg-open ."

alias psa="ps -ef"
alias kall='killall'

# alias goagent="python $GOAGENT_PATH/local/proxy.py"
# alias goagent3="python3 $GOAGENT_PATH/local/proxy.py"

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


# alias for ipython
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

if [ -d $WORKSPACE/VirtualEnv ];
then
    alias devpy="source $WORKSPACE/VirtualEnv/develop/bin/activate"
fi


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
elif which ack > /dev/null
then
    alias ackp='ack --pager=less'
fi

alias sin="dbus-send --dest=com.deepin.dde.dock --print-reply --type=method_call /com/deepin/dde/dock com.deepin.dde.dock.ShowInspector"

alias cnpm="npm --registry=https://registry.npm.taobao.org \
    --cache=$HOME/.npm/.cache/cnpm \
    --disturl=https://npm.taobao.org/dist \
    --userconfig=$HOME/.cnpmrc"
