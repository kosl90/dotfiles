export SRC=$HOME/src
export TOOLS=$SRC/tools
export MYWIKI=$HOME/mywiki
export WIKIDATA=$MYWIKI/wikidata
export NOTES=$HOME/Dropbox/notes

export QT5PATH="/opt/Qt5.1.0/5.1.0/gcc/"

export EDITOR=vim
export GAE_PATH=$HOME/GAE
export GOAGENT_PATH=$GAE_PATH/goagent

# export http_proxy="http://localhost:8087"

export DISPLAY=:0

PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
PATH=$PATH:$TOOLS/apache-maven/bin:$HOME/.cabal/bin:/usr/local/go/bin:$HOME/src/scripts
PATH=$PATH:/opt/QtSDK/Desktop/Qt/4.8.1/gcc/bin:/opt/QtSDK/QtCreator/bin:/usr/local/sml/bin
PATH=$PATH:$GAE_PATH:$HOME/node_modules/.bin/:$QT5PATH/bin/
PATH=$PATH:$HOME/.local/bin

# to fix tmux connect dbus failed
# unset DBUS_SESSION_BUS_ADDRESS