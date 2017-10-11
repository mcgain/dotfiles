# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -f ~/git-prompt.sh ]; then
  source ~/git-prompt.sh
fi

export FZF_DEFAULT_OPTS='--bind j:down,k:up'

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'


#MYSQL
MYSQL=/usr/local/mysql/bin
# export DYLD_LIBRARY_PATH=/usr/local/lib:$DYLD_LIBRARY_PATH


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

#make sed work properly on mac
#export LC_CTYPE=C
#export LANG=C

#EDITOR
EDITOR=vim; export EDITOR

#every time bash shows a prompt, add previous command to master history, then restore from master history
export PROMPT_COMMAND="history -a; history -n"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

if [[ $(hostname) == vagrant* ]]; then
  am_i_vagrant="[V]"
else
  am_i_vagrant=""
fi

alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"
#setopt promptsubst
function colors {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
}

export PS1='\[\033[0;35m\]$(printf '%.0s-' $(seq 1 $(tput cols)))\n\[\e[00;33m\]$am_i_vagrant\[\e[0m\]\[\e[00;31m\]\W\[\033[0;37m\]|\[\033[0;32m\]$(parse_git_branch)\[\e[0m\]: '


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#     . /etc/bash_completion
# fi

if [ -f ~/.custom_git_completion ]; then
  . ~/.custom_git_completion
fi

if [ -f ~/.bash_vagrant ]; then
  . ~/.bash_vagrant
fi

if [ -f ~/.gorc ]; then
  . ~/.gorc
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export TERM="xterm-256color"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#colourise less output
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

__define_git_completion () {
eval "
    _git_$2_shortcut () {
        COMP_LINE=\"git $2\${COMP_LINE#$1}\"
        let COMP_POINT+=$((4+${#2}-${#1}))
        COMP_WORDS=(git $2 \"\${COMP_WORDS[@]:1}\")
        let COMP_CWORD+=1

        local cur words cword prev
        _get_comp_words_by_ref -n =: cur words cword prev
        _git_$2
    }
"
}

__git_shortcut () {
    type _git_$2_shortcut &>/dev/null || __define_git_completion $1 $2
    alias $1="git $2 $3"
    complete -o default -o nospace -F _git_$2_shortcut $1
}

__git_shortcut blubber checkout

alias convert=conv

export PGUSER=postgres
export PATH="$PATH:~/src/AWS-ElasticBeanstalk-CLI-2.6.3/eb/linux/python2.7/"
export PRY=1 #for shopify

# load all the files in .bash
shopt -s dotglob
for file in  ~/.bash/*
do
  source "$file"
done
shopt -u dotglob

export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

chruby 2.2.3

export PATH="$HOME/.yarn/bin:$PATH"

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export WORKON_HOME=~/.virtualenvs
source $(brew --prefix)/bin/virtualenvwrapper.sh

#completion for kubectl
source <(kubectl completion bash)
