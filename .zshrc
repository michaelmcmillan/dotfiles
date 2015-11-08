# Path to your oh-my-zsh installation.
export ZSH=/Users/michaelmcmillan/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

fpath=($fpath $HOME/.zsh/func)
typeset -U fpath

# Set custom prompt
setopt PROMPT_SUBST
autoload -U promptinit
promptinit
prompt grb

# Colorize terminal
alias ls='ls -G'
alias ll='ls -lG'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"

# Nicer history
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# Use vim as the editor
export EDITOR=vi
set -o emacs

# Aliases
alias c='clear'
alias nano='vi'
alias vi='vim'

# Looks up a NTNU username
function ntnu () {
    ssh michaedm@login.stud.ntnu.no "ldapsearch -h at.ntnu.no -x uid=$1" | grep 'cn: ' | cut -d " " -f 2- | head -1 
}

# Scan for webservers on network
function scan_for_webservers () {
    arp -a | cut -d '(' -f2 | cut -d ')' -f1 | xargs curl --connect-timeout 2 -p 80 -v
}

# Change directory into a course
function emne () {
    CODE=$(echo $1 | awk '{print toupper($0)}')
    cd "$(find ~/Google\ Drive/NTNU/ -name "$CODE*" | head -1)" 
}

# Launch irssi over ssh 
function irc () {
    ssh -t michael@littlist.no screen -Urd
}

# Find nearest test-file and test
function to () {
    if [ -e Makefile ]; then
       make test 
       return
    elif [ -e ../Makefile ]; then
        (cd ../ && make test)
        return
    elif [ -e ../../Makefile ]; then
        (cd ../../ && make test)
        return
    elif [ -e ../../../Makefile ]; then
        (cd ../../../ && make test)
        return
    elif [ -e ../../../../Makefile ]; then
        (cd ../../../../ && make test)
        return
    fi

    if [ -e package.json ]; then
       npm test 
       return
    elif [ -e ../package.json ]; then
        (cd ../ && npm test)
        return
    elif [ -e ../../package.json ]; then
        (cd ../../ && npm test)
        return
    elif [ -e ../../../package.json ]; then
        (cd ../../../ && npm test)
        return
    elif [ -e ../../../../package.json ]; then
        (cd ../../../../ && npm test)
        return
    fi
}

# Git prompt components
function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}


# More paths
export PATH="/Users/michaelmcmillan/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/michaelmcmillan/adt-bundle-mac/sdk/tools/:/opt/X11/bin:/usr/local/git/bin:/usr/local/MacGPG2/bin:/Library/TeX/texbin:/usr/local/opt/ruby193/bin:/usr/local/sbin:/usr/local/Cellar/php55/5.5.13/bin:/usr/local/heroku/bin:/usr/local/etc/php/5.4:/opt/local/bin:/opt/local/sbin:/usr/local/Cellar/php54/5.4.19/bin/:/Users/michaelmcmillan/.rvm/gems/ruby-2.0.0-p247/bin:/Users/michaelmcmillan/.rvm/gems/ruby-2.0.0-p247@global/bin:/Users/michaelmcmillan/.rvm/rubies/ruby-2.0.0-p247/bin:/Users/michaelmcmillan/.rvm/bin:/Users/michaelmcmillan/adt-bundle-mac/sdk/tools:/Users/michaelmcmillan/.rvm/bin"
