###############
#             #
# GENERAL     #
#             #
###############

function dev_to_development_version() {
  __sourced_path="/Users/richardmcgain/src/dev/dev.sh"
}

alias c=clear
alias vi=nvim
alias todo=todo2
alias reboot='sudo shutdown -r now'
alias f="find -n"
alias ack=ag
alias cds='cd ~/src/'
alias cdss='cd ~/src/shopify'
alias cdsg='cd ~/src/go/src'
alias blog='cd /Users/richardmcgain/OneDrive/Blog\ Posts'
alias re="rg -g '!/bundle/**' -g '!/test/**' -g '!/doc/**'"
alias k="kubectl"

alias kill_ruby="dalek Ruby && ps -e | grep ruby | sed -e 's/^[ \t]*//' | cut -f 1 -d ' ' | xargs kill -9"

alias babs='babushka'

alias lc="/opt/rubies/2.3.1/bin/ruby /Users/richardmcgain/.gem/ruby/2.3.1/bin/colorls"

#dev aliases
alias d='dev'
alias dc='dev cd'
# alias du='dev up' #conflicts with (d)isk(u)sage du
alias dd='dev down'

# alias knife='cd ~/.chef && bundle exec knife && cd -'

#find and replace in a directory
# far /usr/bin /foo/bar/
# function far() { find "$1" -type f | xargs perl -pi -e "s$2g"; }
alias far='codemod'

alias weather='curl wttr.in/Melbourne'

alias note='~/Projects/notes/notes.sh'
function resource() {
  source ~/.bashrc
}

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

function dalek(){
  echo ""
  echo "                      $1, you will be EXTERMINATED!     "
  echo "                      /"
  echo "                 ___"
  echo "         D>=G==='   '."
  echo "               |======|"
  echo "               |======|"
  echo "           )--/]IIIIII]"
  echo "              |_______|"
  echo "              C O O O D"
  echo "             C O  O  O D"
  echo "            C  O  O  O  D"
  echo "            C__O__O__O__D"
  echo "           [_____________]"
  echo ""
}

###############
#             #
# rails       #
#             #
###############

alias r='bin/rails'
alias rs='bin/rails server'
alias rc='bin/rails console'
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

#############################
#                           #
# PERMISSIONS AND PROCESSES #
#                           #
#############################

alias make_executable='chmod 755'
alias process_listening_on_port='lsof -wni tcp:$1'

###############
#             #
# GIT ALIASES #
#             #
###############

alias g=git
alias gs='git status'
alias gc='git commit'
alias glg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
alias gl="git log --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
alias gb='branch_freshness'
alias gd='git diff --color-words'
alias gdom='git diff --color-words origin/master'
alias gga='git ls-files -dmo --exclude-standard | grep "$*" | xargs -r git add'
alias gco='git checkout'
alias fco='git checkout $(git branch | fzf)'
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
# alias gdmb="git branch --merged | grep --extended-regexp --invert-match 'master|\*' | xargs git branch -d"
alias gcb="git symbolic-ref --short HEAD"
alias gpc="git_push_current_branch"
alias grlm="git_rebase_onto_latest_master"
alias gdmb="diff_merge_base"
alias gcp="git cherry-pick"
alias gam="git commit --amend -a --no-edit"

function branch_freshness() {
  if [ "$#" -eq 0 ]
  then
    git for-each-ref \
      --sort=-committerdate refs/heads/ \
      --format='%(HEAD) %(color:cyan)%(refname:short)%(color:reset) | %(committerdate:relative)%(color:reset) | %(subject)' \
      | column -s '|' -t
    return
  fi
  git branch $@
}

function gsq() {
  git rebase -i `git merge-base HEAD master`
}

function current_branch() {
  git symbolic-ref HEAD | sed 's/refs\/heads\///'
}

function git_rebase_onto_latest_master() {
  temp_current_branch=$(current_branch)
  git fetch origin
  git branch -f master origin/master
  git checkout "$temp_current_branch"
  git rebase master
}

function git_push_current_branch() {
  local_current_branch=$( current_branch )
  if [ "$local_current_branch" == "master" ]; then
    if [ "$1" == "+" ]; then
      if [ "$2" == "--force-no-really-i-mean-it" ]; then
        echo "Don't force push master, you idiot"
        return
      fi
    fi
  fi
  git push -u origin "$1$local_current_branch"
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
  base=$(git merge-base origin/master `current_branch`)
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

alias test='be spring testunit'
alias tunnel_to_vagrant='ssh -N -L $1:localhost:$1 vagrant@192.168.211.38'
alias crusader_kings_saves="cd /Users/richardmcgain/Documents/Paradox\ Interactive/Crusader\ Kings\ II/save\ games"

######################
#                    #
# VERIFY AWS KEYPAIR #
#                    #
######################

alias aws_fingerprint_local='openssl pkcs8 -in ~/.ssh/richard2.pem -nocrypt -topk8 -outform DER | openssl sha1 -c'
alias aws_fingerprint_remote='aws ec2 describe-key-pairs --key-name richard2'
