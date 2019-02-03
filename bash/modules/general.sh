# modules/general.sh
# This file contains general configuration.

# Unbind CTRL-S CTRL-V.
bind -r '\C-s'
stty -ixon
 
# Better completion.
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# Case insensitive completion.
bind "set completion-ignore-case on"
