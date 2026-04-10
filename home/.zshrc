# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

# zsh-completions
if [ -e /opt/homebrew/share/zsh-completions ]; then
    fpath=(/opt/homebrew/share/zsh-completions $fpath)
fi

# History
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000        # メモリ上の履歴リストに保存されるイベントの最大数
export SAVEHIST=100000        # 履歴ファイルに保存されるイベントの最大数

setopt hist_expire_dups_first # 履歴を切り詰める際に、重複する最も古いイベントから消す
setopt hist_ignore_all_dups   # 履歴が重複した場合に古い履歴を削除する
setopt hist_ignore_dups       # 前回のイベントと重複する場合、履歴に保存しない
setopt hist_save_no_dups      # 履歴ファイルに書き出す際、新しいコマンドと重複する古いコマンドは切り捨てる
setopt share_history          # 全てのセッションで履歴を共有する

# go
export GOPATH=$HOME/go
export PATH=$(brew --prefix)/opt/coreutils/libexec/gnubin:$GOPATH/bin:/opt/homebrew/opt/postgresql@13/bin:$PATH

# alias
alias ls='ls -G'
alias la='ls -AG'
alias ll='ls -lG'
alias restart='exec $SHELL -l'
alias gbdelete='git branch | xargs git branch -d'
alias nippo="gh issue list --repo Ryu955/nippo --limit 1 --json number --jq '.[0].number' | xargs -I {} gh issue view {} --repo Ryu955/nippo --web"
gcm() {
git checkout main 2>/dev/null || git checkout master
}

# work aliases
if [ -f ~/.zsh_work_aliases ]; then
    source ~/.zsh_work_aliases
fi

# fzf
if [ -f ~/.zsh_fzf ]; then
    source ~/.zsh_fzf
fi

# Git
fpath=(~/.zsh ~/.zsh/completion $fpath)

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

setopt PROMPT_SUBST

# mise
eval "$(mise activate zsh)"

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

# aws-vault
eval "$(aws-vault --completion-script-zsh)"

export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
# export PATH="/opt/homebrew/opt/go@1.24/bin:$PATH"

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"

# pnpm
export PNPM_HOME="/Users/ryu/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="$HOME/.local/bin:$PATH"

export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
