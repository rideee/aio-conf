# modules/aliases.sh
# This file contains all user defined aliases.

### General ###
alias ':q'='exit'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -lah'
alias l='ls -1'
alias ..='cd ..'

# Reload .bashrc source.
[ -f ~/.bashrc ] && alias reload='. ~/.bashrc'

# Private aliases.
# Use viprivatealiases to edit this file 
[ -f $BASHRC_MODULES/private-aliases.sh ] \
  && . $BASHRC_MODULES/private-aliases.sh \
  && alias viprivaliases="$EDITOR $BASHRC_MODULES/private-aliases.sh"


### Dependent on third-party packages ###
# Tmux.
[ "$(type tmux 2>/dev/null)" ] && alias tmux='tmux -u'

# Neovim.
[ "$(type nvim 2>/dev/null)" ] && alias vi='nvim'

# Atom package manager.
[ "$(type apm 2>/dev/null)" ] && alias apm='apm --color'

# Tree.
[ "$(type tree 2>/dev/null)" ] && alias tree='tree -C'
