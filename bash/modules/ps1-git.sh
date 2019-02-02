# modules/ps1-git.sh
#
# Author: Michal Katnik (github.com/rideee).
# License: GPL.

# ps1-git.sh: set $PS1 variable. After execution prompt look like this:
#
#   username > current_dir_name $
#
# If in current directory is some git branch, transform to this:
#
#   git(master) userame > current_dir_name $
# 
# Everything is colorized.
# It is possible to define colors and format in variables below.

function ps1-git() {
  # PS1 colors and format. It use modules/autoload/color.sh.
  local PS1_ARW="\[\033[1;92m>$(tput sgr0)\]"
  local PS1_USR="\[$(color lblue)\]\u\[$(color none)\]"
  local PS1_DIR="\[$(color yellow)\]\W\[$(color none)\]"
  local PS1_PROMCHAR="\[$(color lblue)\]$\[$(color none)\]"
  
  # Check if root.
  if [ $(whoami) = 'root' ]; then
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

  local PS1_STYLE="$PS1_GIT$PS1_USR $PS1_ARW $PS1_DIR $PS1_PROMCHAR "

  export PS1=$PS1_STYLE
}

ps1-git

# Run ps1-git after changing directory.
function cd() {
  builtin cd "$@"
  ps1-git
}
