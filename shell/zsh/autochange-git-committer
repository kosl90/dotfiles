autoload -U add-zsh-hook
autochange-git-committer() {
    local GIT_AUTHOR="$(python3 $USER_DOTFILE_PATH/shell/zsh/git-author.py)"
    local OLD_GIT_AUTHOR_NAME=$GIT_AUTHOR_NAME;
    local DEFAULT_GIT_NAME="$(git config --get user.name)"
    local DEFAULT_GIT_EMAIL="$(git config --get user.email)"
    eval $GIT_AUTHOR

    if [ x"$GIT_AUTHOR" = x ]; then
        unset GIT_COMMITTER_NAME
        unset GIT_COMMITTER_EMAIL
        unset GIT_AUTHOR_NAME
        unset GIT_AUTHOR_EMAIL

        if [ "$OLD_GIT_AUTHOR_NAME" != "$GIT_AUTHOR_NAME" ];then
            echo "Setting git author to '$DEFAULT_GIT_NAME <$DEFAULT_GIT_EMAIL>'";
        fi
    elif [ "$OLD_GIT_AUTHOR_NAME" != "$GIT_AUTHOR_NAME" ]; then
        echo "Setting git author to '$GIT_AUTHOR_NAME <$GIT_AUTHOR_EMAIL>'";
    fi
}
add-zsh-hook chpwd autochange-git-committer
autochange-git-committer
