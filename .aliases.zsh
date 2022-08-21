###############
#             #
#   general   #
#             #
###############

alias k='kubectl'
alias cds='cd ~/src/'
alias re="rg -g '!/bundle/**' -g '!/test/**' -g '!/doc/**' -g '!/spec/**'"
alias kill_ruby="dalek Ruby && ps -e | grep ruby | sed -e 's/^[ \t]*//' | cut -f 1 -d ' ' | xargs kill -9"
alias vi="nvim"
alias vim="nvim"
alias c="clear"
alias less="less -R"
alias resource="source ~/.aliases.zsh"
alias cat=batcat

alias ll='ls -l'
alias la='ls -a'

# open files from the last commit
function vc() {
  vi -O `git show --pretty="format:" --name-only "$@" | tr -s "\\n" " "`;
}

# open files from git diff
function vd() {
  vi -O `git ls-files --modified --exclude-standard | tr -s "\\n" " "`;
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
# dotfiles    #
#             #
###############
alias vimrc='nvim ~/.vimrc'
alias aliases='nvim ~/.aliases.zsh'

###############
#             #
# rails       #
#             #
###############

alias r='bin/rails'
alias rs='bin/rails server'
alias rc='bin/rails console'
alias bi='bundle install'

###############
#             #
# GIT ALIASES #
#             #
###############

alias g='git'
alias gs='git status'
alias gc='git commit'
alias glg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
alias gl="git log --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
alias gb='branch_freshness'
alias gd='git diff --color-words'
alias gdom='git diff --color-words origin/main'
alias gga='git ls-files -dmo --exclude-standard | grep "$*" | xargs -r git add'
alias gco='git checkout'
alias fco='git checkout $(git branch | fzf)'
alias gnb='git checkout -b'
alias gp='git pull'
alias gpa='git pull develop; git fetch devheroku'
alias ga='git add'
alias gcm='git checkout main'
alias gcd='git checkout develop'
alias grm='git rebase main'
alias grc='git rebase --continue'
alias gmt='git mergetool'
alias gmd='merge_current_dev_branch'
alias gcb="git symbolic-ref --short HEAD"
alias gpc="git_push_current_branch"
alias grlm="git_rebase_onto_latest_main"
alias gdmb="diff_merge_base"
alias gcp="git cherry-pick"
alias gam="git commit --amend -a --no-edit"

alias opr="open_pull_request"

function fub() {
  cwd=$(pwd)
  cd services/fub
  "$@"
  cd $cwd
}

function merge_current_dev_branch() {
  current_git_branch=`current_branch`;
  git checkout develop;
  git merge --no-edit $current_git_branch;
  git branch -d $current_git_branch
}

function branch_freshness() {
  format_str="%(HEAD) %(color:cyan)%(refname:short)%(color:reset) | %(committerdate:relative)%(color:reset) | %(subject)"
  if [[ "$#" -eq 0 ]]
  then
    git for-each-ref --sort=-committerdate refs/heads/ --format=$format_str --color | /usr/local/opt/util-linux/bin/column -s '|' -t -c $COLUMNS -T 3
    return
  fi
  git branch $@
}

function gsq() {
  git rebase -i `git merge-base HEAD main`
}

function current_branch() {
  # git symbolic-ref --short -q HEAD
  git symbolic-ref HEAD | sed 's/refs\/heads\///'
}

function git_rebase_onto_latest_main() {
  temp_current_branch=$(current_branch)
  git fetch origin
  git branch -f main origin/main
  git checkout "$temp_current_branch"
  git rebase main
}

function diff_merge_base() {
  base=$(git merge-base origin/main `current_branch`)
  git diff --color-words $base $@
}

function git_push_current_branch() {
  local_current_branch=$( current_branch )
  if [[ "$local_current_branch" == "main" ]]; then
    if [[ "$1" == "+" ]]; then
      if [[ "$2" == "--force-no-really-i-mean-it" ]]; then
        echo "Don't force push main, you idiot"
        return
      fi
    fi
  fi
  git push -u origin "$1$local_current_branch"
}

function clone() {
  name=$(echo $1 | sed 's/.*\///')
  git clone git@github.com:$1 ~/src/$name
  cd ~/src/$name
}

function open_pull_request() {
  branch=$(current_branch);
  repo=$(git remote get-url --all origin | cut -d':' -f'2')
  open "http://www.github.com/$repo/compare/$branch?expand=1"
}
