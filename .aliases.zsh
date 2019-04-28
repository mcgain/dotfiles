###############
#             #
#   general   #
#             #
###############

alias k='kubectl'
alias cds='cd ~/src/'
alias re="rg -g '!/bundle/**' -g '!/test/**' -g '!/doc/**'"
alias kill_ruby="dalek Ruby && ps -e | grep ruby | sed -e 's/^[ \t]*//' | cut -f 1 -d ' ' | xargs kill -9"
alias vi="nvim"
alias vim="nvim"

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
alias process_listening_on_port='lsof -wni tcp:$1'

###############
#             #
#     dev     #
#             #
###############
alias d='dev'
alias dc='dev cd'
alias dd='dev down'
alias dup='dev up'

alias far='codemod'

###############
#             #
# rails       #
#             #
###############

alias r='bin/rails'
alias rs='bin/rails server'
alias rc='bin/rails console'

###############
#             #
# GIT ALIASES #
#             #
###############

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
alias grm='git rebase master'
alias grc='git rebase --continue'
alias gmt='git mergetool'
alias gmd='current_git_branch=`current_branch`; git checkout develop; git merge --no-edit $current_git_branch; git branch -d $current_git_branch'
alias gcb="git symbolic-ref --short HEAD"
alias gpc="git_push_current_branch"
alias grlm="git_rebase_onto_latest_master"
alias gdmb="diff_merge_base"
alias gcp="git cherry-pick"
alias gam="git commit --amend -a --no-edit"

function branch_freshness() {
  if [[ "$#" -eq 0 ]]
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
  if [[ "$local_current_branch" == "master" ]]; then
    if [[ "$1" == "+" ]]; then
      if [[ "$2" == "--force-no-really-i-mean-it" ]]; then
        echo "Don't force push master, you idiot"
        return
      fi
    fi
  fi
  git push -u origin "$1$local_current_branch"
}
