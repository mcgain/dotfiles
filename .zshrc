# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}$HOME/.kube/config:$HOME/.kube/config.shopify.cloudplatform
fpath=(~/.zsh/plugins/ $fpath)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.zshoptions.zsh
source ~/.aliases.zsh

# https://github.com/sindresorhus/pure
# fpath+=/home/mcgain/.zsh/plugins/pure
# autoload -U promptinit; promptinit
# prompt pure
#
# zstyle :prompt:pure:path color cyan

eval "$(starship init zsh)"

PATH=$PATH:/usr/lib/postgresql/10/bin

cd ~ # go home

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-2.6

source ~/.welcome.zsh

source /home/mcgain/.config/broot/launcher/bash/br
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
