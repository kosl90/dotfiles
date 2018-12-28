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

USER_LOCAL_BIN=$HOME/.local/bin
if ! [ -d $USER_LOCAL_BIN ]
then
    mkdir -p $USER_LOCAL_BIN
fi

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
PATH=$HOME/.cabal/bin:$PATH
#PATH=/usr/local/sml/bin:$PATH

USER_LOCAL_PATH=$USER_LOCAL_BIN
for i in `find -L $USER_LOCAL_BIN -mindepth 1 -maxdepth 1 -type d`;
do
    if [ -d $i/bin ]
    then
        USER_LOCAL_PATH=$USER_LOCAL_PATH:$i/bin
    elif [ -d $i/usr/bin ]
    then
        USER_LOCAL_PATH=$USER_LOCAL_PATH:$i/usr/bin
    fi
done
PATH=$USER_LOCAL_PATH:$PATH

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

PATH="$HOME/.dotfiles/diff-so-fancy:$PATH"

PATH=$GOPATH/bin:$GOROOT/bin:/usr/lib/go/bin:$PATH

PATH=$HOME/.pip/bin:$HOME/.yarn/bin:$PATH

# to fix tmux connect dbus failed
# unset DBUS_SESSION_BUS_ADDRESS

# for npm
export PHANTOMJS_CDNURL=https://npm.taobao.org/dist/phantomjs/
export ELECTRON_MIRROR=https://npm.taobao.org/mirrors/electron/
export CHROMEDRIVER_CDNURL=https://npm.taobao.org/mirrors/chromedriver

# for flutter
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
