# Share history file amongst all Zsh sessions, ignoring dupes
setopt append_history share_history histignorealldups

# enable completion
autoload compinit && compinit
#enable colours in completion
zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}

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
