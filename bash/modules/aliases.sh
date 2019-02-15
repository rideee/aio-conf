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

### Dependent on the OS ###
# Arch Linux.
alias systemctl='sudo systemctl'
alias hibernate='systemctl hibernate'
alias pacman='sudo pacman'
alias pacnc='pacman --noconfirm'
alias pacSyyu='pacman -Syyu --noconfirm'
alias aur='yaourt'
alias aurnc='yaourt --noconfirm'

### Dependent on third-party packages ###
# Tmux.
[ "$(type tmux 2>/dev/null)" ] && alias tmux='tmux -u'

# Neovim.
[ "$(type nvim 2>/dev/null)" ] && alias vi='nvim'

# Atom package manager.
[ "$(type apm 2>/dev/null)" ] && alias apm='apm --color'

# SSHFS - riddev.eu.
alias mount-ridATriddev='sshfs rid@riddev.eu:/home/rid /mnt/ridATriddev'
alias umount-ridATriddev='sudo umount /mnt/ridATriddev'
alias mount-riddevATriddev='sshfs riddev@riddev.eu:/var/www/html/riddev/public /mnt/riddevATriddev'
alias umount-riddevATriddev='sudo umount /mnt/riddevATriddev'

# Tree.
[ "$(type tree 2>/dev/null)" ] && alias tree='tree -C'
