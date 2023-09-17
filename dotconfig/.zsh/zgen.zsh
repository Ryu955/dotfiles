# zgen
if [[ -f "$HOME/.zgen/zgen.zsh" ]]; then
  # load zgen
  source "$HOME/.zgen/zgen.zsh"

  # if the init scipt doesn't exist
  if ! zgen saved; then

    # specify plugins here
    zgen oh-my-zsh

    zgen load 'blimmer/zsh-aws-vault'
    zgen load 'wfxr/forgit'

    # generate the init script from plugins above
    zgen save
  fi
fi

