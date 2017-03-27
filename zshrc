# Section zgen {{{
source "${HOME}/.zgen/zgen.zsh"

# load zgen if not already cached
if ! zgen saved; then
    zgen oh-my-zsh

    # themes
    #zgen oh-my-zsh themes/af-magic
    #zgen load therealklanni/purity
    zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train
    #zgen load zakaziko99/agnosterzak-ohmyzsh-theme

    #zgen load mafredri/zsh-async
    #zgen load sindresorhus/pure

    # plugins
    zgen load zuxfoucault/colored-man-pages_mod
    zgen load b4b4r07/emoji-cli

    #zgen load zsh-users/zsh-completions src
    #zgen load zsh-users/zsh-history-substring-search
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-autosuggestions

    # omz plugins
    zgen oh-my-zsh plugins/catimg
    #zgen oh-my-zsh plugins/command-not-found
    #zgen oh-my-zsh plugins/fabric
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/python
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/vundle

    zgen oh-my-zsh plugins/history
    zgen oh-my-zsh plugins/history-substring-search

    zgen save
fi

# }}}

# Section Bullettrain prompt {{{
BULLETTRAIN_PROMPT_ORDER=(
    time
    status
    custom
#   context
    dir
    perl
    ruby
    virtualenv
    go
    git
    hg
    cmd_exec_time
)

tab () {
    if [[ ! -z "$@" ]]; then
        # resolve emoji's in text
        text=`emojify "$@"`
        export DISABLE_AUTO_TITLE=true
        BULLETTRAIN_CUSTOM_MSG="\"$text \""
        title "$text"
    else
        export DISABLE_AUTO_TITLE=
        BULLETTRAIN_CUSTOM_MSG=
    fi
}

# }}}

# Section history search config {{{

# Path to your oh-my-zsh configuration.
export DEBIAN_PREVENT_KEYBOARD_CHANGES=yes

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Shift up/down for beginning of command search
bindkey "$terminfo[kri]" history-beginning-search-backward
bindkey "$terminfo[kind]" history-beginning-search-forward

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd '^[k' history-beginning-search-backward
bindkey -M vicmd '^[j' history-beginning-search-forward
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# }}}

# Section original omz {{{

# https://github.com/robbyrussell/oh-my-zsh/pull/5435
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# zsh VI mode
# bindkey -v
# export KEYTIMEOUT=1

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
# }}}

# Section General variables and aliases {{{
export PATH=~/bin:$PATH
export PATH='/opt/firefox':$PATH
export TERM=xterm-256color 
unsetopt correct_all

# tricks so that ctrl-s works in vim
#alias vim="stty stop '' -ixoff ; vim"
# `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f

alias l='ls -l'
alias mvn-jetty-debug='MAVEN_OPTS="-XX:MaxPermSize=2048m -Xrunjdwp:transport=dt_socket,address=8000,server=y" mvn jetty:run'
alias mvn=mvn-color
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
export TERM="xterm-256color"

function _fab_complete() {
     local cur
     cur="${COMP_WORDS[COMP_CWORD]}"
     COMPREPLY=( $(compgen -W "$(fab -F short -l)" -- ${cur}) )
     return 0
}

# oracle: https://gist.github.com/thom-nic/6011715
export ORACLE_HOME=/usr/lib/share/oracle/instantclient
export DYLD_LIBRARY_PATH=$ORACLE_HOME
export LD_LIBRARY_PATH=$ORACLE_HOME

# dircolors for solarized from:
# curl https://raw.github.com/seebi/dircolors-solarized/master/dircolors.256dark > ~/.dircolors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

[[ -s "/Users/kperkins/.gvm/bin/gvm-init.sh" ]] && source "/Users/kperkins/.gvm/bin/gvm-init.sh"

alias grails="echo '\n'; \grails"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# }}}

# Section more git aliases {{{
alias wow="git status -s"
alias such=git
alias very=git
alias so=glol
alias st="open -a SourceTree"

#}}}

# Section local overrides {{{
#
#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/Users/kperkins/.sdkman"
#[[ -s "/Users/kperkins/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/kperkins/.sdkman/bin/sdkman-init.sh"

if [[ -f  "$HOME/.localzshrc" ]]; then
    source "$HOME/.localzshrc"
fi
# }}}

# vim:foldmethod=marker:foldlevel=0
