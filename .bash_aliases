###############
#             #
# GENERAL     #
#             #
###############

alias c=clear
alias vi=vim
alias todo=todo2
alias reboot='sudo shutdown -r now'
alias far="ag -l 'module/summary_bar.' | xargs sed -i 's/summary_bar/summary_bar.css.less/'"

alias ag=ack-grep
alias note='~/Projects/notes/notes.sh'

#find and replace

#find_and_replace(what_to_include, what_to_find, what_to_replace){

#}

#sudo the command, or if none given, sudo the last thing done.
s(){
  if [[ $# == 0 ]]; then
    sudo $(history -p '!!')
  else
    sudo "$@"
  fi
}

###############
#             #
# rails       #
#             #
###############

alias r='bundle exec rails'
alias rs='bundle exec rails server -p 13000'
alias rc='bundle exec rails console'

alias rdbmt='bundle exec rake db:migrate RAILS_ENV=test'

alias pull_production_into_local='heroku pgbackups:capture; curl -o latest.dump `heroku pgbackups:url`; pg_restore --verbos --clean --no-acl --no-owner -h localhost -U mcgain -d kutoto_development latest.dump'
alias rjs='RAILS_ENV=test bundle exec rails server -p 13000'

###############
#             #
#   shopify   #
#             #
###############

alias test='bundle exec rake test PARALLEL=1'
#alias testjs=

###############
#             #
# easy editing#
#             #
###############

alias bash_aliases='vi ~/.bash_aliases'
alias vimrc='vi ~/.vimrc'
alias bashrc='vi ~/.bashrc'

function vc() {
  vi `git show --pretty="format:" --name-only "$@" | tr -s "\\n" " "`;
}

function vd() {
  vi `git ls-files --modified --exclude-standard | tr -s "\\n" " "`;
}

###############
#             #
# navigation  #
#             #
###############

alias cdlist='cd ~/Projects/List'
alias cdblarg='cd ~/Projects/Blarg'
alias cddynasty='cd ~/Projects/dynasty'
alias cdshopify='cd ~/Code/Ruby/shopify'

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
alias gk='gitk --all 2> /dev/null &'
alias gphd='git push devheroku develop:master'
alias gpgh='git push origin develop'
alias grd='git rebase develop'
alias grc='git rebase --continue'
alias gmt='git mergetool'
alias gmd='current_git_branch=`git symbolic-ref HEAD | cut -d"/" -f 3`; git checkout develop; git merge --no-edit $current_git_branch; git branch -d $current_git_branch'
alias gdmb="git branch --merged | grep --extended-regexp --invert-match 'master|\*' | xargs git branch -d"

######################
#                    #
# EDUCATIONAL ALIASES#
#                    #
######################

alias ipconfig='echo "The ipconfig command here is called ifconfig"'

######################
#                    #
#      HEROKU        #
#                    #
######################

alias hrc-dev='heroku run console --app devkutoto'
alias hrc-stag='heroku run console --app stagkutoto'
alias hrc-prod='heroku run console --app kutotoca'

