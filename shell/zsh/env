. ${USER_DOTFILE_PATH}/shell/zsh/autochange-git-committer

# echo "USE_MANPAGER: ${USE_MANPAGER}"
#
if [ "$USE_MANPAGER" = "bat" ]; then
  if which bat >& /dev/null; then
      # echo set MANPAGER
      # use bat to do syntax highlight
      export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  fi
fi

if [ "$USE_MANPAGER" = "nvim" ]; then
  echo "use nvim MANPAGER"
  export MANPAGER="nvim +Man!"
fi
