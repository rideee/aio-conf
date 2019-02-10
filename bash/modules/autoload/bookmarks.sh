# modules/autoload/bookmarks.sh
#
# Author Michal Katnik (github.com/rideee)
# License: GPL.
#
# Script bookmarks.sh stores paths in file,
# and allows you to manage them by using bookmarks or bms command.
# Check '$ bms --help' for more informations.
#
# It use modules/autoload/color.sh as dependency.


alias bms=bookmarks

function bookmarks() {
  local BMS_MODULES="$BASHRC_MODULES/autoload/bookmarks"
  local BMS_DIR="$HOME/.rid/bookmarks"
  local BMS_FILE="bms-storage.rid"

  BMS_FILE="$BMS_DIR/$BMS_FILE"

  [ ! -d "$BMS_DIR" ] && mkdir -p $BMS_DIR
  [ ! -f "$BMS_FILE" ] && touch "$BMS_FILE"

  case $1 in
    
    save | s)
      if [[ -z $2 ]]; then
        >&2 echo -e \
          "$(color red)bookmarks: Argument [NAME] is required.$(color none)" 
      else
        [[ -z $3 ]] && local BMS_PATH=$(pwd) || local BMS_PATH=$3
        if [[ $(grep -i "bookmark_$2" $BMS_FILE) == "" ]]; then
          echo "bookmark_$2=$BMS_PATH" >> $BMS_FILE
          echo -e "\n$(color magenta)Bookmark:$(color blue)"
          echo -e "$2 $(color none)-> $(color yellow)$BMS_PATH"
          echo -e "$(color none)has been saved.\n"
        else
          echo -ne "$(color red)bookmarks: "
          echo -ne "$(color yellow)'$2' $(color red)"
          echo -ne "already exist.$(color none)\n"
        fi

      fi
      ;;

    print | p)
      if [[ -z $2 ]]; then
        >&2 echo -e \
          "$(color red)bookmarks: Argument [NAME] is required.$(color none)" 
      else
        local path=$(grep -i "bookmark_$2=" $BMS_FILE)
        path=${path/"bookmark_$2="/''}
        
        echo $path
      fi
      ;;

    list | ls)
      [ -s "$BMS_FILE" ] && \
        echo -e "\n$(color magenta)Bookmarks:$(color none)" || \
        echo -e "\n$(color magenta)Bookmarks list is empty.$(color none)"

      local i=1
      while read line; do
        local b_name=$(echo $line | grep -io 'bookmark_[a-z0-9_-]\+')
        local b_path=${line/$b_name/''}
        b_name=${b_name/'bookmark_'/''}
        b_path=${b_path/'='/''}

        echo -ne "$(color none)$i) "
        echo -ne "$(color blue)$b_name" 
        echo -ne "$(color none) -> "
        echo -ne "$(color yellow)$b_path"
        echo -e $(color none)

        i=$((i+1))
      done < $BMS_FILE
      echo ''
      ;;

    jump | j | cd)
      if [[ -z $2 ]]; then
        >&2 echo -e \
          "$(color red)bookmarks: Argument [NAME] is required.$(color none)" 
      else
        local target=$(bms p $2)

        if [[ $target != '' ]]; then
          target=${target/' '/\\' '}
          eval cd $target
          echo -en "$(color magenta)Jumped into: "
          echo -e "$(color yellow)$target"
        else
          echo -e "$(color red)bookmarks: '$2' does not exist."
        fi

      fi

      ;;

    remove | rm)
      if [[ -z $2 ]]; then
        >&2 echo -e \
          "$(color red)bookmarks: Argument [NAME] is required.$(color none)" 
      else
        local b_path=$(bms p $2)
        
        if [[ $b_path == '' ]]; then
          >&2 echo -e \
            "$(color red)bookmarks: '$2' does not exist.$(color none)" 
        else
          echo -e "\n$(color magenta)Removing bookmark: $(color none)"
          echo -e "$(color blue)$2$(color none) -> $(color yellow)$b_path"
          echo -ne "$(color magenta)"
          echo -ne "\nAre you sure? "
          echo -n "$(color none)(y/n) "
          read ans
          
          if [[ $ans == n ]]; then
            echo "Ok, I'll keep it."
          else
            grep -iv "bookmark_$2=" $BMS_FILE > $BMS_FILE.tmp
            mv $BMS_FILE $BMS_FILE.bak
            mv $BMS_FILE.tmp $BMS_FILE
            echo -e "$(color blue)$2$(color none) has been removed.\n"
          fi

        fi

      fi
      ;;

    remove-all | rma)
      echo -en "\n$(color magenta)Remove all bookmarks?$(color none) (y/n) "
      read ans
      if [[ $ans == 'y' ]]; then
        mv $BMS_FILE $BMS_FILE.bak
        touch $BMS_FILE
        echo -e "\nDone.\n"
      else
        echo -e "\nOk, I'll keep them.\n"
      fi
      ;;

    * )

    ;;
  esac
}
