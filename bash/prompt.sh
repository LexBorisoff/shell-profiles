# ~/.bashrc - color prompt block

COLOR_TIME="\[\033[1;30m\]"
COLOR_GIT="\[\033[0;33m\]"
COLOR_DIR="\[\033[1;31m\]"
COLOR_DEF="\[\033[00m\]"

__update_ps1() {
  __get_git_branch() {
    git branch --show-current 2>/dev/null | sed 's/^/(/;s/$/)/g'
  }
  PS1="\n${COLOR_TIME}[\@] ${COLOR_GIT}$(__get_git_branch)"
  PS1="$PS1\n${COLOR_DIR}\w"
  PS1="$PS1\n${COLOR_GIT}\$${COLOR_DEF} "
}

PROMPT_COMMAND=__update_ps1
