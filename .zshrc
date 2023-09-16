# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

# zsh-completions(補完機能)の設定
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -U compinit
compinit -u

# android studio
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"

export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
export ANDROID_AVD_HOME="$HOME/.android/avd"

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
# export PATH="$PATH:$GOPATH/bin"
export GOROOT="/usr/local/Cellar/go/1.21.0/libexec"

# alias
alias ls='ls -G'
alias la='ls -AG'
alias ll='ls -lG'
alias restart='exec $SHELL -l'
alias gbdelete='git branch | xargs git branch -d'

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# Git
fpath=(~/.zsh $fpath)

if [ -f ${HOME}/.zsh/git-completion.zsh ]; then
        zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh
fi

if [ -f ${HOME}/.zsh/git-prompt.sh ]; then
        source ${HOME}/.zsh/git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '

eval "$(anyenv init -)"

fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit
compinit -u

export CLICOLOR=1

function left-prompt {
  echo '%F{green}%n: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f\$ '
}

PROMPT=`left-prompt`

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ideaをコマンドラインから開く
idea() {
    open -na "IntelliJ IDEA.app" --args nosplash "$@"
}

# include .zshrc.zgen
[[ -f "$HOME/.zsh/zgen.zsh" ]] && source "$HOME/.zsh/zgen.zsh"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# aws-vault
eval "$(aws-vault --completion-script-zsh)"

