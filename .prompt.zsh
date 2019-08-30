autoload colors && colors
autoload -Uz vcs_info
precmd() {
  vcs_info
  prompt_dir_string=$(if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    if [[ $PWD == '/Users/richardmcgain' ]]; then
      echo "~"
    else
      echo "%C"
    fi
  else
    echo "%~"
  fi)
}
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:stagedstr' unstagedstr "%{$fg[green]✚$reset_color%}"
zstyle ':vcs_info:*' unstagedstr "%{$fg[yellow]✚$reset_color%}"
zstyle ':vcs_info:git*' formats "%{$fg[yellow]%}%b%{$reset_color%} %m%u%c%{$reset_color%} %a"

setopt prompt_subst
PROMPT='%?%{$fg_bold[green]%}📂$prompt_dir_string%{$reset_color%}${vcs_info_msg_0_} %# '
