###############
#             #
# GENERAL     #
#             #
###############
#
alias v="cd ~/code/ruby/vagrant; vagrant ssh"

alias c=clear
alias vi=vim
alias todo=todo2
alias reboot='sudo shutdown -r now'
alias far="ag -l 'module/summary_bar.' | xargs sed -i 's/summary_bar/summary_bar.css.less/'"
alias f="find -n"
alias ack=ag

alias note='~/Projects/notes/notes.sh'
function resource() {
  source ~/.bash_aliases
}
#find and replace

#find_and_replace(what_to_include, what_to_find, what_to_replace){

#}

# most used commands in percentage format
function most_used_commands() {
  history | awk '($2 ~ /^[[:alnum:]]+$/) { ++a[$2]; t = length($2); if (t > l) l = t; } END { for (i in a) printf("%s%" (l - length(i) + 1) "s%5.2f%%\n", i, " ", (a[i] * 100 / NR)); }' | sort -n -k2
}

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
alias rs='bundle exec rails server '
alias rc='bundle exec rails console'
alias be='bundle exec'
alias bi='bundle install -j 8'

alias rdbmt='bundle exec rake db:migrate RAILS_ENV=test'

alias pull_production_into_local='heroku pgbackups:capture; curl -o latest.dump `heroku pgbackups:url`; pg_restore --verbos --clean --no-acl --no-owner -h localhost -U mcgain -d kutoto_development latest.dump'
alias rjs='RAILS_ENV=test bundle exec rails server -p 13000 --pid /tmp/rjs.pid'

#zeus test `git status -s | grep -e "^ M test/" --color=none | cut -c 4-`

###############
#             #
#   shopify   #
#             #
###############

# alias test='bundle exec rake test PARALLEL=1'

# function my_test() {
  # script/testonly
  # if [ -e .zeus.sock ]; then
  #   bundle exec zeus test $@;
  # elif grep -q "spring-commands-testunit" Gemfile; then
  #     bundle exec spring testunit $@;
  # else
  #   bundle exec ruby -Itest $@;
  # fi
# }

#alias testjs=
alias clearcache="redis-cli -p 16379 flushall && echo \"flush_all\" | nc  127.0.0.1 21211"

###############
#             #
# easy editing#
#             #
###############

alias bash_aliases='vi ~/.bash_aliases'
alias vimrc='vi ~/.vimrc'
alias bashrc='vi ~/.bashrc'

function vc() {
  vi -O `git show --pretty="format:" --name-only "$@" | tr -s "\\n" " "`;
}

function vd() {
  vi -O `git ls-files --modified --exclude-standard | tr -s "\\n" " "`;
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
alias cdquality='cd ~/Code/Ruby/quality_bot'

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
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
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
alias grm='git rebase master'
alias grc='git rebase --continue'
alias gmt='git mergetool'
alias gmd='current_git_branch=`current_branch`; git checkout develop; git merge --no-edit $current_git_branch; git branch -d $current_git_branch'
alias gdmb="git branch --merged | grep --extended-regexp --invert-match 'master|\*' | xargs git branch -d"
alias gcb="git symbolic-ref --short HEAD"
alias gpc="git_push_current_branch"
alias grlm="git_rebase_onto_latest_master"
alias gdmb="diff_merge_base"

function current_branch() {
  git symbolic-ref HEAD | sed 's/refs\/heads\///'
}

function git_rebase_onto_latest_master() {
  temp_current_branch= current_branch
  git fetch origin
  git checkout $temp_current_branch
  git rebase origin/master
}

function git_push_current_branch() {
  git push -u origin $1`current_branch`
}

function ssh_to_guest() {
  ssh 192.168.211.1
  echo "echo ssh"
  echo $1
  $1
  exit
}

function hob() {
  echo "hov"
  current_branch="$(git symbolic-ref --short HEAD)"
  if hash hub 2>/dev/null; then
    echo "hubbing"
    hub browse "Shopify/shopify/tree/$current_branch"
  else
    echo "sshinfg"
    ssh_to_guest "open http://www.github.com/shopify/Shopify/compare/$current_branch"
  fi
}

function diff_merge_base() {
  base=$(git merge-base master `current_branch`)
    git diff --color-words $base
}

######################
#                    #
# EDUCATIONAL ALIASES#
#                    #
######################

alias ipconfig='echo "The ipconfig command here is called ifconfig"'
alias symbolic-ref='echo "The command to create symbolic links is ln -s source dest"'

######################
#                    #
#      HEROKU        #
#                    #
######################

alias hrc-dev='heroku run console --app devkutoto'
alias hrc-stag='heroku run console --app stagkutoto'
alias hrc-prod='heroku run console --app kutotoca'

