export NOTES=$HOME/Dropbox/notes

export QT5PATH="/opt/Qt5.1.1/5.1.1/gcc/"

if [ -d $HOME/Workspace ]
then
    export WORKSPACE=$HOME/Workspace
else
    export WORKSPACE=$HOME/workspace
fi
export EDITOR=vim
export GAE_PATH=$HOME/GAE
export GOAGENT_PATH=$GAE_PATH/goagent

export DISPLAY=:0

export GOPATH=$WORKSPACE/golang/

export SBT_OPTS="${SBT_OPTS} -DsocksProxyHost=127.0.0.1 -DsocksProxyPort=7070"
#export SBT_OPTS="${SBT_OPTS} -DhttpProxy.Host=127.0.0.1 -DhttoProxy.Port=7070"

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
PATH=$HOME/.cabal/bin:$PATH
PATH=/usr/local/sml/bin:$PATH
PATH=$GAE_PATH:$HOME/node_modules/.bin/:$PATH
PATH=$HOME/.local/bin:$PATH
PATH=$QT5PATH/bin:$PATH
PATH=$MY_GOPATH/bin:$GOPATH/bin:$DEEPIN_GOPATH/bin:/usr/lib/go/bin:$PATH

# to fix tmux connect dbus failed
# unset DBUS_SESSION_BUS_ADDRESS
