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
export EDITOR=vim
set -o emacs

# Aliases
alias c='clear'
alias nano='vi'
alias vi='vim'

# Git prompt components
function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1`
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
}

# More paths
export PATH="/Users/michaelmcmillan/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/michaelmcmillan/adt-bundle-mac/sdk/tools/:/opt/X11/bin:/usr/local/git/bin:/usr/local/MacGPG2/bin:/Library/TeX/texbin:/usr/local/opt/ruby193/bin:/usr/local/sbin:/usr/local/Cellar/php55/5.5.13/bin:/usr/local/heroku/bin:/usr/local/etc/php/5.4:/opt/local/bin:/opt/local/sbin:/usr/local/Cellar/php54/5.4.19/bin/:/Users/michaelmcmillan/.rvm/gems/ruby-2.0.0-p247/bin:/Users/michaelmcmillan/.rvm/gems/ruby-2.0.0-p247@global/bin:/Users/michaelmcmillan/.rvm/rubies/ruby-2.0.0-p247/bin:/Users/michaelmcmillan/.rvm/bin:/Users/michaelmcmillan/adt-bundle-mac/sdk/tools:/Users/michaelmcmillan/.rvm/bin:/Users/michaelmcmillan/scripts"
