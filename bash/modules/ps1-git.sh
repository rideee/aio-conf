# modules/ps1-git.sh
#
# Author: Michal Katnik (github.com/rideee).
# License: GPL.
#
# This script sets $PS1 environment variable.
# For customization colors and format change values of variables below.

function ps1-git() {
  # PS1 colors and format. It use modules/autoload/color.sh.
  #local PS1_ARW="\[\033[1;92m\]>\[$(tput sgr0)\]"
  #local PS1_USR="\[$(color lblue)\]\u\[$(color none)\]"
  #local PS1_HOST="\[$(color lgreen)\]\h\[$(color none)\]"
  local PS1_DIR="\[$(color yellow)\]\w\[$(color none)\]"
  local PS1_PROMCHAR="\[$(color lblue)\]$\[$(color none)\]"
  
  # Check if root.
  if [ "$EUID" -eq 0 ]; then
    PS1_USR="\[$(color lred)\]\u\[$(color none)\]"
    PS1_PROMCHAR="\[$(color lred)\]"'#'"\[$(color none)\]"
  fi

  # Git.
  local PS1_GIT_BRANCH=$(git branch 2> /dev/null \
    | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  
  if [ $PS1_GIT_BRANCH ]; then
    local PS1_GIT="\[$(color yellow)\]git"
    PS1_GIT+="\[$(color lblue)\]("
    PS1_GIT+="\[$(color lgreen)\]$PS1_GIT_BRANCH"
    PS1_GIT+="\[$(color lblue)\]) "
  fi

  export PS1="\[\e[100m\]$PS1_GIT$PS1_DIR\[\e[0m\] $PS1_PROMCHAR "
}

ps1-git

# Run ps1-git after changing directory.
function cd() {
  builtin cd "$@"
  ps1-git
}
