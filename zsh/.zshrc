p10k="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
if [[ -r "$p10k" ]]; then
  source "$p10k"
fi

export ZSH=$HOME/.oh-my-zsh
DISABLE_AUTO_TITLE="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=(git tmux history sudo zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ..="cd ../"
alias cls="clear"
alias q="exit"

alias vvvv="vim"
alias vim="nvim"
alias v="nvim"

alias t="tmux"
alias ss="sudo systemctl"
alias logs="sudo journalctl -u"
alias rr="make run"
alias glog="git log --oneline --decorate --graph"

bindkey '^[^I' autosuggest-accept

bindkey "^[w" forward-word
bindkey "^[b" backward-word

bindkey "^[h" backward-char
bindkey "^[j" down-line-or-history
bindkey "^[k" up-line-or-history
bindkey "^[l" forward-char

bindkey "^[c" kill-whole-line

bindkey "^[[" beginning-of-line

eval "$(starship init zsh)"
