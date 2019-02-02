# modules/autoload.sh

# This script adds to .bashrc everything in modules/autoload directory.

for F in $BASHRC_MODULES/autoload/*; do
  source $F
done
