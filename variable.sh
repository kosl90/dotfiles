export EDITOR=vim
export DISPLAY=:0

if [ -d $HOME/Dropbox ]
then
    export NOTES=$HOME/Dropbox/notes
fi

if [ -z $WORKSPACE ]
then
    if [ -d $HOME/Workspace ]
    then
        export WORKSPACE=$HOME/Workspace
    elif [ -d $HOME/workspace ]
    then
        export WORKSPACE=$HOME/workspace
    fi
fi

#export SBT_OPTS="${SBT_OPTS} -DsocksProxyHost=127.0.0.1 -DsocksProxyPort=7070"
#export SBT_OPTS="${SBT_OPTS} -DhttpProxy.Host=127.0.0.1 -DhttoProxy.Port=7070"

export DDE=$WORKSPACE/deepin/dde-workspace
export DAEMON=$WORKSPACE/deepin/gohome/src/pkg.linuxdeepin.com/dde-daemon/

MY_GOPATH=$WORKSPACE/gohome/
SYS_GOPATH=/usr/share/gocode
export GOPATH=$MY_GOPATH:$SYS_GOPATH

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
PATH=$HOME/.cabal/bin:$PATH
PATH=$HOME/.local/bin:$PATH
PATH=$MY_GOPATH/bin:$SYS_GOPATH/bin:/usr/lib/go/bin:$PATH

export XDG_DATA_HOME=${XDG_DATA_HOME=$HOME/.local/share}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME=$HOME/.config}
export XDG_DATA_DIRS=${XDG_DATA_DIRS=/usr/local/share:/usr/share}
export XDG_CONFIG_DIRS=${XDG_CONFIG_DIRS=/etc/xdg}
export XDG_CACHE_HOME=${XDG_CACHE_HOME=$HOME/.cache}

if [ -d $HOME/GAE ]
then
    export GAE_PATH=$HOME/GAE
    export GOAGENT_PATH=$GAE_PATH/goagent
    PATH=$GAE_PATH:$PATH
fi

if [ -d $HOME/node_modules ]
then
    PATH=$HOME/node_modules/.bin/:$PATH
fi

if ! [ -z $QT5PATH ]
then
    PATH=$QT5PATH/bin:$PATH
fi

if [ -z $GOPATH ]
then
    if [ -d /usr/lib/go ] || [ -d /usr/local/lib/go ]
    then
        export GOPATH=$WORKSPACE/golang/
    fi
fi

# TODO: $GOROOT/bin
if ! [ -z $GOPATH ]
then
    PATH=$GOPATH/bin:/usr/lib/go/bin:$PATH
fi

export WEBKIT_INSPECTOR_PATH=$HOME/webinspector

# to fix tmux connect dbus failed
# unset DBUS_SESSION_BUS_ADDRESS
