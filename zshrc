# Antigen setup

source "$HOME/.antigen.zsh"

antigen bundle pip
antigen bundle rsync
antigen bundle python
#antigen bundle virtualenvwrapper
antigen bundle node
antigen bundle npm
antigen bundle rake
antigen bundle rvm
antigen bundle bundler
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle command-not-found
antigen bundle history
antigen bundle tmux
antigen bundle vundle
antigen bundle fabric
antigen bundle git

antigen use oh-my-zsh
antigen bundle ssh-agent

antigen bundle robbyrussell/oh-my-zsh

antigen-theme af-magic
antigen-apply

# Path to your oh-my-zsh configuration.
export DEBIAN_PREVENT_KEYBOARD_CHANGES=yes

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
#DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

export PATH=~/bin:$PATH
export PATH='/opt/firefox':$PATH
export TERM=xterm-256color 
alias l='ls -l'
unsetopt correct_all

# tricks so that ctrl-s works in vim
alias vim="stty stop '' -ixoff ; vim"
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f

# bash
# No ttyctl, so we need to save and then restore terminal settings
vim()
{
    local STTYOPTS="$(stty --save)"
    stty stop '' -ixoff
    command vim "$@"
    stty "$STTYOPTS"
}
alias mvn-jetty-debug='MAVEN_OPTS="-XX:MaxPermSize=2048m -Xrunjdwp:transport=dt_socket,address=8000,server=y" mvn jetty:run'
alias mysql="mysql --pager='less -n -i -S -F -X'"
alias l=ls
export ORACLE_HOME=/opt/instantclient

export CLASSPATH=$CLASSPATH:/usr/share/java/libreadline-java.jar
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jni/

export PAGER='less -n -i -S -F -X'
export PYTHONPATH=$PYTHONPATH:$HOME/python

export GIT_PS1_SHOWDIRTYSTATE=true
source /usr/local/bin/virtualenvwrapper.sh
export PYTHONPATH=$PYTHONPATH:$HOME/pylib

# this seems to be needed by vim Powerline for colors to work
# not sure why...!
#export TERM="xterm-256color"

# function _fab_complete() { 
#     local cur 
 #    cur="${COMP_WORDS[COMP_CWORD]}" 
#     COMPREPLY=( $(compgen -W "$(fab -F short -l)" -- ${cur}) ) 
#     return 0 
# } 

# enable programmable completion features (you don't need to enable 
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile 
# sources /etc/bash.bashrc). 

# dircolors for solarized from:
# curl https://raw.github.com/seebi/dircolors-solarized/master/dircolors.256dark > ~/.dircolors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

