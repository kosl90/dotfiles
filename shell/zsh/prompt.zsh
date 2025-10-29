# echo "USE_PROMPT: ${USE_PROMPT}"

if [[ $USE_PROMPT = "p10k" ]]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

if [[ "$USE_PROMPT" = "pure" ]]; then
    # start_time=$(date +"%N")
    # echo start at $(date +"%N")
    autoload -U promptinit; promptinit
    prompt pure
    # echo end at $(date +"%N")
    # end_time=$(date +"%N")
    # echo start pure prompt: $(($end_time/1000000 - $start_time / 1000000))ms
fi

if which starship >& /dev/null; then
  if [[ "$USE_PROMPT" = "starship" ]]; then
      # start_time=$(date +"%N")
      eval "$(starship init zsh)"
      # end_time=$(date +"%N")
      # echo start starship prompt: $(($end_time / 1000000 - $start_time / 1000000))ms
  fi
else
  echo "please install starship first"
fi

