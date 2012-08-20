###############
#             #
# GENERAL     #
#             #
###############

alias c=clear
alias vi=vim
alias todo=todo2
alias reboot='sudo shutdown -r now'

###############
#             #
# navigation  #
#             #
###############

alias cdlist='cd ~/Projects/List'
alias cdblarg='cd ~/Projects/Blarg'
alias cddynasty='cd ~/Projects/dynasty'

###############
#             #
# PERMISSIONS #
#             #
###############

alias make_executable='chmod 755'


###############
#             #
# GIT ALIASES #
#             #
###############

alias g=git
alias gs='git status'
alias gc='git commit'
alias gl='git log'
alias gd='git diff --color-words'
alias gga='git ls-files -dmo --exclude-standard | grep $* | xargs -r git add'
alias gco='git checkout'
alias gnb='git checkout -b'
alias gp='git pull'

######################
#                    #
# COMPLETION FOR GIT #
#                    #
######################

complete -o default -o nospace -F _git g

function make-completion-wrapper () {
  local function_name="$2"
    local arg_count=$(($#-3))
    local comp_function_name="$1"
    shift 2
    local function="
    function $function_name {
      ((COMP_CWORD+=$arg_count))
        COMP_WORDS=( "$@" \${COMP_WORDS[@]:1} )
        "$comp_function_name"
        return 0
    }"
  eval "$function"
}

make-completion-wrapper _git _git_checkout_mine git checkout
complete -o bashdefault -o default -o nospace -F _git_checkout_mine gco

make-completion-wrapper _git _git_branch_mine git branch
complete -o bashdefault -o default -o nospace -F _git_branch_mine gb



