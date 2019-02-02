# modules/autoload/color.sh
# color.sh
# Author: Michal Katnik (github.com/rideee)
# Version: 0.1
# License: GPL

# This is automatically loaded function.
# It simply print ANSI Escape Sequence, for colorful output.
# It is very limitted for now, maybe in future will be improved.


# Helper function use for make escape string.
function color_makeEsc() {
  echo -e "\033[$1m"
}

# Main.
function color() {
  case $1 in 
    black)  color_makeEsc 30
      ;;
    red)  color_makeEsc 31
      ;;
    green)  color_makeEsc 32
      ;;
    yellow)  color_makeEsc 33
      ;;
    blue)  color_makeEsc 34
      ;;
    magenta)  color_makeEsc 35
      ;;
    cyan)  color_makeEsc 36
      ;;
    lgray)  color_makeEsc 37
      ;;
    dgray)  color_makeEsc 90
      ;;
    lred)  color_makeEsc 91
      ;;
    lgreen)  color_makeEsc 92
      ;;
    lyellow)  color_makeEsc 93
      ;;
    lblue)  color_makeEsc 94
      ;;
    lmagenta)  color_makeEsc 95
      ;;
    lcyan)  color_makeEsc 96
      ;;
    white)  color_makeEsc 97
      ;;

    *) color_makeEsc 39
  esac
}
