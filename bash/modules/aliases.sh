# modules/aliases.sh
# This file contains all user defined aliases.

### General ###
alias ':q'='exit'
alias grep='grep --color=auto'
alias grep='egrep --color=auto'
alias grep='fgrep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l'
alias l='ls -lah'

# Reload .bashrc source.
alias reload='. ~/.bashrc'

### Dependent on the OS ###
# Arch Linux.
alias systemctl='sudo systemctl'
alias hibernate='systemctl hibernate'
alias pacman='sudo pacman'

### Dependent on third-party packages ###
# Tmux.
alias tmux='tmux -u'

# Neovim.
alias vi='nvim'

# Atom package manager.
alias apm='apm --color'

# SSHFS - riddev.eu.
alias mount-ridATriddev='sshfs rid@riddev.eu:/home/rid /mnt/ridATriddev'
alias umount-ridATriddev='sudo umount /mnt/ridATriddev'
alias mount-riddevATriddev='sshfs riddev@riddev.eu:/var/www/html/riddev/public /mnt/riddevATriddev'
alias umount-riddevATriddev='sudo umount /mnt/riddevATriddev'

# Tree.
alias tree='tree -C'

# TMP.
alias rgoimp="/home/rid/.rid/sh/rid-goimports.sh"
alias serve="browser-sync start --server --files \"css/*.css, *.css, *.html\""
alias srv='bash /home/rid/.rid/sh/srv.sh'
alias watchTree='bash /home/rid/.rid/sh/watchTree.sh'
alias rwt='watchTree'

