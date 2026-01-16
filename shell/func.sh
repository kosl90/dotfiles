function cman() {
    env \
        LESS_TERMCAP_mb="$(printf '\e[1;31m')" \
        LESS_TERMCAP_md="$(printf '\e[1;31m')" \
        LESS_TERMCAP_me="$(printf '\e[0m')" \
        LESS_TERMCAP_se="$(printf '\e[0m')" \
        LESS_TERMCAP_so="$(printf '\e[1;44;33m')" \
        LESS_TERMCAP_ue="$(printf '\e[0m')" \
        LESS_TERMCAP_us="$(printf '\e[1;32m')" \
        man "$@"
}


function vman() {
    local VI=/usr/bin/vim
    if [ -f /usr/local/bin/vim ]; then
        local VI=/usr/local/bin/vim
    fi

    if [ $# -eq 1 ]; then
        if /usr/bin/whatis "$@" > /dev/null; then
            $VI -c "Man $*" -c "silent! only" -c "nmap q :q<cr>"
        else
            /usr/bin/man "$@"
        fi
    elif [[ $# -eq 2 && "$1" =~ "[[:digit:]]" ]]; then
        $VI -c "Man $*" -c "silent! only" -c "nmap q :q<cr>"
    else
        echo "usage: $0 [page] keyword"
    fi
}


# function gcd() {
#     if [ -d "$(git rev-parse --show-toplevel)/$1" ]
#     then
#         cd $(git rev-parse --show-toplevel)/$1
#     else
#         echo "no such a directory $(git rev-parse --show-toplevel)/$1"
#     fi
# }
#
# # this is from git plugin.
# # unalias g alias to make g function work.
# if alias g >& /dev/null
# then
#     unalias g
# fi
# function g() {
#     case $1 in
#         "cd")
#             shift
#             gcd $@
#             ;;
#         *)
#             git $@
#             ;;
#     esac
# }

function groot() {
    git rev-parse --show-toplevel
}

function version() {
	dpkg -p "$1" | grep -i version
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

function add_to_user_local_bin() {
    target=$(pwd)
    if ! [ -z "$1" ]
    then
      target=$(realpath "$1")
    fi
    ln -sf "$target" "$HOME/.local/bin"
    src # oh-my-zsh zsh-reload plugin
}

function update-pandafan() {
    if [ "$PANDAFAN_CONFIG_URL" = "" ]; then
        echo "missing \$PANDAFAN_CONFIG_URL";
        exit
    fi

    local f=${HOME}/.config/clash/config.yaml
    if [ -f "$f" ]; then
        local backupConfig=$HOME/.config/clash/config.old.yaml
        echo -n "backup file exists, the old backup file will be overwriten[Y/n]: "
        read -r yesOrNo
        yesOrNo=${yesOrNo:-"y"}
        if [[ $yesOrNo =~ [yY] ]];
        then
            echo "backup the old configuration to ${backupConfig}"
            cp -f "$f" "${backupConfig}"
        else
            echo "cancel update"
            return
        fi
    fi
    wget --output-document "$f" "${PANDAFAN_CONFIG_URL}"
}

function findRcPackages() {
    if grep -iP 'ubuntu|deepin|debian' /etc/os-release &> /dev/null ; then
        dpkg -l | grep '^rc' | awk '{print $2}'
    fi
}

function useClash() {
    export HTTPS_PROXY=http://127.0.0.1:7890 HTTP_PROXY=http://127.0.0.1:7890 ALL_PROXY=socks5://127.0.0.1:7890 GLOBAL_AGENT_HTTP_PROXY=http://127.0.0.1:7890 GLOBAL_AGENT_HTTPS_PROXY=http://127.0.0.1:7890
}

function useNoClash() {
    export HTTP_PROXY='' HTTPS_PROXY='' ALL_PROXY='' GLOBAL_AGENT_HTTP_PROXY='' GLOBAL_AGENT_HTTPS_PROXY=''
    unset HTTP_PROXY HTTPS_PROXY ALL_PROXY GLOBAL_AGENT_HTTP_PROXY GLOBAL_AGENT_HTTPS_PROXY
}

function useNoProxy() {
    useNoClash
}

function useSelfGitConfig() {
  export GIT_AUTHOR_NAME=kosl90
  export GIT_AUTHOR_EMAIL=kos1990l@gmail.com
  export GIT_COMMITTER_NAME=kosl90
  export GIT_COMMITTER_EMAIL=kos1990l@gmail.com
}

function useKsGitConfig() {
  export GIT_AUTHOR_NAME=liliqiang
  export GIT_AUTHOR_EMAIL=liliqiang@kingsoft.com
  export GIT_COMMITTER_NAME=liliqiang
  export GIT_COMMITTER_EMAIL=liliqiang@kingsoft.com
}
