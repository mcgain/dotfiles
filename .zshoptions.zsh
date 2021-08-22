# Share history file amongst all Zsh sessions, ignoring dupes
# setopt append_history share_history histignorealldups
# Appends every command to the history file once it is executed
# setopt inc_append_history
# Reloads the history whenever you use it

#these are from https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/history.zsh
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

# enable completion
autoload compinit && compinit
#enable colours in completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# treat slashes as a word boundary
WORDCHARS=$WORDCHARS:s:/:

# extended globs
setopt extendedglob
# examples:
#  rm ../debianpackage(.)   # remove files only
#  ls -d *(/)               # list directories only
#  ls /etc/*(@)             # list symlinks only
#  ls -l *.(png|jpg|gif)    # list pictures only
#  ls *(*)                  # list executables only
#  ls /etc/**/zsh           # which directories contain 'zsh'?
#  ls **/*(-@)              # list dangling symlinks ('**' recurses down directory trees)
#  ls foo*~*bar*            # match everything that starts with foo but doesn't contain bar

export EDITOR=vi

#inputrc isn't respecting the control left-arrow stuff for some reason
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
