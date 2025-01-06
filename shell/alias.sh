# this is from debian plugin for dpkg -i,
# unalias di to make di(a advanced disk information utility) work.
if alias di >& /dev/null
then
    unalias di
fi

OS=$(uname)
# echo "OS: $OS"
unalias grep
if [ $OS = 'Linux' ];
then
  alias grep='grep -P --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn,.pc}'
else
  alias grep='grep --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn,.pc}'
fi

# general
alias synapse='(synapse -s &)'
alias t='tmux -2u'
alias tmux='tmux -2u'
alias sx=startx

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
if [ $OS = 'Linux' ]; then
  alias ll="ls -Flh --color=auto"
  alias ls="ls -F --color=auto"
else
  alias ll="ls -FlhG"
  alias ls='ls -FG'
fi
alias l=ls
alias lls=ls


# alias for make
alias mc='make clean'
alias mr='make run'

if [ $OS = 'Linux' ]; then
  alias mk="make -j$(($(grep processor /proc/cpuinfo | wc -l) + 1))"
else
  alias mk='make'
fi

alias mdc='make distclean'
alias mkd='make dist'


# alias for vim
alias vim='vim -p'
alias vi=vim

# alias for git
alias glg="git log --graph --decorate"
alias glo="git log --oneline --graph --decorate"
alias gdf="git diff"
alias gdc="git diff --cached"
alias gdw="git diff --word-diff"
alias gst="git status -sb"

if which bat >&/dev/null; then
  alias cat=bat
fi

# if which pnpm >&/dev/null; then
    alias pn=pnpm
    alias pni="pnpm install"
    alias i="pnpm install"
    alias b="pnpm build"
    alias pnb="pnpm build"
    alias pns="pnpm start"
    alias d="pnpm dev"
    alias pnv="pnpm serve"
# fi

# alias sin="dbus-send --dest=com.deepin.dde.dock --print-reply --type=method_call /com/deepin/dde/dock com.deepin.dde.dock.ShowInspector"
