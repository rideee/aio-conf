# modules/autoload/vimodules.sh

# Shortcuts for editing modules.
function vialiases() {
  $EDITOR $BASHRC_MODULES/aliases.sh
}

function vigeneral() {
  $EDITOR $BASHRC_MODULES/general.sh
}

function vienvs() {
  $EDITOR $BASHRC_MODULES/env-vars.sh
}

# This is management function for automatically loaded scripts.
alias ader=autoloader
function autoloader() {
  case $1 in
    list | ls) 
      for f in $BASHRC_MODULES/autoload/*; do
        [[ ! -d $f ]] && basename $f
      done
      ;;
    path | p) echo $BASHRC_MODULES/autoload/
      ;;
    edit | e) 
      if [ -f $BASHRC_MODULES/autoload/$2 ]; then
        $EDITOR $BASHRC_MODULES/autoload/$2
      else
        >&2 echo "$(color red)autoloader:$(color none)" \
        "File '$2' does not exist."
      fi
      ;;
    add | a)
      if [ -f $BASHRC_MODULES/autoload/$2 ]; then
        >&2 echo "$(color red)autoloader:$(color none)" \
        "Can't create file: '$2'. Already exist."
      else
        $EDITOR $BASHRC_MODULES/autoload/$2
      fi
      ;;
    remove | rm) 
      if [ -f $BASHRC_MODULES/autoload/$2 ]; then
        echo -n "$(color yellow)autoloader:$(color none)" \
        "Do you really want to remove '$2'? (y/n) "
        read response
        [ $response = y -o $response = Y ] \
          && rm $BASHRC_MODULES/autoload/$2 \
          && echo "$(color green)autoloader:$(color none)"\
                  "File '$2' has been removed."\
          || echo "$(color yellow)autoloader:$(color none)" \
                  'No changes were made.'
      else
        >&2 echo "$(color red)autoloader:$(color none)" \
        "File '$2' does not exist."
      fi
      ;;
    *)
      echo -e "$(color magenta)# modules/autoloader/vimodules.sh$(color none)"
      echo -e "$(color blue)This is simple function for management"\
        "automatically loaded scripts.$(color none)"
      echo -e "$(color blue)Usage:$(color none)" \
        'autoloader [OPTION] [FILE]'
      echo -e "$(color yellow)[Alias 'ader' is also available]$(color none)\n"
      echo -e "$(color blue)Options:$(color none)"
      echo -n " [list | ls]"
      echo -e "$(color yellow)\t\tList all scripts$(color none)"
      echo -n " [path | p]"
      echo -e "$(color yellow)\t\tPrint path to scripts directory$(color none)"
      echo -n " [add | a] [FILE]"
      echo -e "$(color yellow)\tCreate new script$(color none)"
      echo -n " [edit | e] [FILE]"
      echo -e "$(color yellow)\tEdit script$(color none)"
      echo -n " [remove | rm] [FILE]"
      echo -e "$(color yellow)\tRemove script$(color none)"
      echo -n " [help | * | no args]"
      echo -e "$(color yellow)\tThis text$(color none)"
      ;;
  esac
}
