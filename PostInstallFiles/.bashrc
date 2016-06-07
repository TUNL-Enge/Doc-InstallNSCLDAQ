# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions
if [ -f /etc/bash.bashrc ]; then
        . /etc/bash.bashrc
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


##########################################################
# DAQ Stuff
##########################################################

## Path
export PATH=$PATH:~/bin

## NSCLDAQ
if [ ! -h ~/stagearea ]
then
  ln -s ~/events ~/stagearea
fi

export HOMEDIR=$HOME                             # Production
export NSCLBASE=$HOME

export DISTDIR=/usr/opt/applications
export BinDir=$HOMEDIR/bin                        # Experiment's executables.
export DAQHOST=localhost                          # Everything is local.
export SSHTARGET=localhost
export INSTROOT=/usr/opt/nscldaq/current
export TCLLIBPATH="$TCLLIBPATH $INSTROOT/lib $INSTROOT/Scripts $INSTROOT/TclLibs" 
export PATH=$PATH:/usr/opt/nscldaq/current/bin:/usr/opt/spectcl/current/bin:~/bin

## MIDAS
export LANG=C
export MIDASSYS=$HOME/midas/packages/midas
export PATH=$PATH:$MIDASSYS/linux/bin
export MIDAS_EXPTAB=/home/daq/midas/online/exptab

# For default remote Midas server to myhost
#export MIDAS_SERVER_HOST=localhost:7071

# For default Midas experiment
#export MIDAS_EXPT_NAME=default
