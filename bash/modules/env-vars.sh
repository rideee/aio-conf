# modules/env-vars.sh
# This file contains all user defined exported environment variables.

# English terminal output.
export LC_MESSAGES=C

# Vim as default editor.
export EDITOR='vim'

# Golang.
export GOPATH='/home/rid/go'
export GOBIN='/home/rid/go/bin'
export PATH=/home/rid/go/bin:$PATH

# Shell scripts.
# This is user definded path to all own executable shell scripts.
export PATH=/home/rid/sh/exec:$PATH

