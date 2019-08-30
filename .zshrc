# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}$HOME/.kube/config:$HOME/.kube/config.shopify.cloudplatform
fpath=(~/.zsh/plugins/ $fpath)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /opt/dev/dev.sh
source ~/.zshoptions.zsh
source ~/.aliases.zsh
# source ~/.prompt.zsh
autoload -U promptinit; promptinit
prompt pure
