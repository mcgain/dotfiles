# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}$HOME/.kube/config:$HOME/.kube/config.shopify.cloudplatform
fpath=(~/.zsh/plugins/ $fpath)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# https://github.com/sindresorhus/pure
# fpath+=/home/mcgain/.zsh/plugins/pure
# autoload -U promptinit; promptinit
# prompt pure
#
# zstyle :prompt:pure:path color cyan

eval "$(starship init zsh)"

PATH=$PATH:/usr/lib/postgresql/10/bin
PATH=$PATH:$HOME/postgres/bin
PATH=$PATH:$HOME/bin

cd ~ # go home

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-3.0

source ~/.welcome.zsh

source /home/mcgain/.config/broot/launcher/bash/br
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

source ~/.zshoptions.zsh
source ~/.aliases.zsh

#For WSL2, I am running an xServer and I need the address to communicate with
# from https://www.gregbrisebois.com/posts/chromedriver-in-wsl2/
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.services.zsh
