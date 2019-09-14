# modules/env-vars.sh
# This file contains all user defined exported environment variables.

# English terminal output.
export LC_MESSAGES=C

# Vim as default editor.
export EDITOR='nvim'

# Local binary files
export PATH=/home/rid/.local/bin:$PATH

# Executable scripts
export PATH=/home/rid/.local/exec:$PATH

# Golang.
export GOPATH='/home/rid/go'
export GOBIN='/home/rid/go/bin'
export PATH=/home/rid/.local/gobin:$PATH

# Java 11 - OpenJDK 11
#export PATH=/usr/lib/jvm/java-11-openjdk/bin:$PATH

# Oracle Java 8 - JDK SE 8
#export PATH=/usr/lib/jvm/jdk1.8.0_201/bin:$PATH

# Oracle Java 11 - JDK SE 11
export PATH=/usr/lib/jvm/jdk-11.0.2/bin:$PATH
