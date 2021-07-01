# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}$HOME/.kube/config:$HOME/.kube/config.shopify.cloudplatform
fpath=(~/.zsh/plugins/ $fpath)

export EDITOR=nvim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.zshoptions.zsh
source ~/.aliases.zsh
source ~/.ferocia-specific.zsh

# https://github.com/sindresorhus/pure
# fpath+=/home/mcgain/.zsh/plugins/pure
# autoload -U promptinit; promptinit
# prompt pure
#
# zstyle :prompt:pure:path color cyan

eval "$(starship init zsh)"

eval "$(nodenv init -)"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/bin:$PATH"


cd ~ # go home

source ~/.welcome.zsh

alias dotfiles="/usr/bin/git --git-dir=$HOME/src/dotfiles/ --work-tree=$HOME"
