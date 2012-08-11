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
