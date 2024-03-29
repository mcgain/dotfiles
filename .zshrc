# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}$HOME/.kube/config:$HOME/.kube/config.shopify.cloudplatform:$HOME/.kube/config-turing-pi
fpath=(~/.zsh/plugins/ $fpath)

export EDITOR=nvim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.zshoptions.zsh
source ~/.aliases.zsh
source ~/.ferocia.zsh

# https://github.com/sindresorhus/pure
# fpath+=/home/mcgain/.zsh/plugins/pure
# autoload -U promptinit; promptinit
# prompt pure
#
# zstyle :prompt:pure:path color cyan

eval "$(starship init zsh)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/mnt/c/Users/mcgai/AppData/Local/Programs/Microsoft\ VS\ Code\ Insiders/bin/:$PATH"

cd ~ # go home

source ~/.welcome.zsh

alias dotfiles="/usr/bin/git --git-dir=$HOME/src/dotfiles/ --work-tree=$HOME"
# alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
export PGUSER=postgres
# export PGDATA=/home/mcgain/postgres/data
export PATH=$PATH:/home/mcgain/.local/bin
export PATH=$PATH:/opt/chrome-linux/
export PATH=$PATH:/home/mcgain/.yarn/bin
export PATH=$PATH:/home/mcgain/bin
export PATH=$PATH:/Users/mcgain/src/z
export PATH=$PATH:/usr/local/pgsql/bin/
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-3.0.1

export FLYCTL_INSTALL="/home/mcgain/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

source /home/mcgain/.config/broot/launcher/bash/br
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PATH="/Users/mcgain/Library/Python/3.9/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

export PATH=$PATH:/home/mcgain/postgres/bin
export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(/opt/homebrew/bin/brew --prefix openssl@1.1)"
export PATH="opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
