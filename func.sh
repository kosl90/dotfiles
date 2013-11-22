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
    if [ "$(git rev-parse --show-toplevel)" != "" ]
    then
        if [ "$1" != "" ]
        then
            cd "$(git rev-parse --show-toplevel)/$1"
        else
            cd $(git rev-parse --show-toplevel)
        fi
    fi
}
gcd() {
    if [ "$(git rev-parse --show-toplevel)" != "" ]
    then
        if [ "$1" != "" ]
        then
            cd "$(git rev-parse --show-toplevel)/$1"
        else
            cd $(git rev-parse --show-toplevel)
        fi
    fi
}
