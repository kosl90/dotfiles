export EDITOR=nvim
export DISPLAY=:0

if [ -d $HOME/Dropbox ]
then
    export NOTES=$HOME/Dropbox/notes
fi

if [ -z "$WORKSPACE" ]
then
    if [ -d "$HOME/workspace" ]
    then
        export WORKSPACE=$HOME/workspace
    elif [[ -d "$HOME/Workspace" ]]
    then
        export WORKSPACE=$HOME/Workspace
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
# PATH=$HOME/.cabal/bin:$PATH
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

if ! [ -z $QT5PATH ]
then
    PATH=$QT5PATH/bin:$PATH
fi

if [ -z $GOPATH ]
then
    if [ -d /usr/lib/go ] || [ -d /usr/local/lib/go ]
    then
        if [ -d $WORKSPACE/go ]
        then
            export GOPATH=$WORKSPACE/go/
        elif [ -d $HOME/go ]
        then
            export GOPATH=$HOME/go/
        elif [ -d $WORKSPACE/golang ]
        then
            export GOPATH=$WORKSPACE/golang/
        elif [ -d $HOME/golang ]
        then
            export GOPATH=$HOME/go/
        fi
    fi
fi

# PATH="$HOME/.dotfiles/diff-so-fancy:$PATH"

export GOPATH=$HOME/workspace/go
export GOBIN=$GOPATH/bin
PATH=$GOPATH/bin:$GOROOT/bin:/usr/lib/go/bin:$PATH

PATH=$HOME/.pip/bin:$HOME/.yarn/bin:$PATH

# to fix tmux connect dbus failed
# unset DBUS_SESSION_BUS_ADDRESS

# for flutter
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

# for rust
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

# for homebrew
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_PIP_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"

export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"
export HOMEBREW_PIP_INDEX_URL="https://mirrors.ustc.edu.cn/pypi/web/simple"

export ADBLOCK=true
export DISABLE_OPENCOLLECTIVE=true
