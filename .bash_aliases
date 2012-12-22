###############
#             #
# GENERAL     #
#             #
###############

alias c=clear
alias vi=vim
alias todo=todo2
alias reboot='sudo shutdown -r now'

alias ag=ack-grep
alias note='~/Projects/notes/notes.sh'

###############
#             #
# rails       #
#             #
###############

alias r=rails
alias rs='rails server'
alias rc='rails console'

###############
#             #
# easy editing#
#             #
###############

alias bash_aliases='vi ~/.bash_aliases'
alias vimrc='vi ~/.vimrc'

###############
#             #
# navigation  #
#             #
###############

alias cdlist='cd ~/Projects/List'
alias cdblarg='cd ~/Projects/Blarg'
alias cddynasty='cd ~/Projects/dynasty'
alias cdkutoto='cd ~/Projects/kutotorails'

alias explore='xdg-open .'

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
alias gb='git branch'
alias gd='git diff --color-words'
alias gga='git ls-files -dmo --exclude-standard | grep $* | xargs -r git add'
alias gco='git checkout'
alias gnb='git checkout -b'
alias gp='git pull'
alias gpa='git pull develop; git fetch devheroku'
alias ga='git add'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gk='gitk --all &'
alias gphd='git push devheroku develop:master'
alias gpgh='git push origin develop'
alias grd='git rebase develop'

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

######################
#                    #
# EDUCATIONAL ALIASES#
#                    #
######################

alias ipconfig='echo "The ipconfig command here is called ifconfig"'

