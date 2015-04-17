function cman() {
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


function vman() {
    /usr/bin/whatis $@ > /dev/null

    if [ $? -eq 0 ]; then
        /usr/bin/vim -c "Man $@" -c "silent! only" -c "nmap q :q<cr>"
    else
        /usr/bin/man "$@"
    fi
}


function gcd() {
    if [ -d "$(git rev-parse --show-toplevel)/$1" ]
    then
        cd $(git rev-parse --show-toplevel)/$1
    else
        echo "no such a directory $(git rev-parse --show-toplevel)/$1"
    fi
}

# this is from git plugin.
# unalias g alias to make g function work.
if alias g >& /dev/null
then
    unalias g
fi
function g() {
    case $1 in
        "cd")
            shift
            gcd $@
            ;;
        *)
            git $@
            ;;
    esac
}

function version() {
	dpkg -p $1 | grep -i version
}

function dlog {
if [ -s "/var/log/deepin.log" ]; then
	logfile='/var/log/deepin.log'
else
	logfile='/var/log/deepin.log.1'
fi
colortail -n 50 --follow --config=<(cat <<EOF
COLOR green
{
	^(.*\[NEW\].*)$
}

COLOR brightblue
{
	^(.*\[DEBUG\])
}

COLOR brightyellow
{
	^(.*\[WARNING\].*)$
}

COLOR brightred
{
	^(.*\[ERROR\].*)$
}
EOF
) "${logfile}"
}
