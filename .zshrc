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
=======
export PATH=$PATH:/home/mcgain/postgres/bin
export PGDATA=/home/mcgain/postgres/data
export PATH=$PATH:/home/mcgain/.local/bin
export PATH=$PATH:/opt/chrome-linux/
export PATH=$PATH:/home/mcgain/.yarn/bin
export PATH=$PATH:/home/mcgain/bin
cd ~ # go home

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-2.7


export PATH="$HOME/.cargo/bin:$PATH"

source /home/mcgain/.config/broot/launcher/bash/br
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
