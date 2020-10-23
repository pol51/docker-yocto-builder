# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

export PS1_pre="\[\e[1;36m\]\D{%R}\[\e[m\] \[\e[1;31m\]\u\[\e[m\]\[\e[1;33m\]@\[\e[m\]\[\e[1;37m\]\h \[\e[1;32m\]\w\[\e[m\]"
export PS1_post="\[\e[1;33m\]%\[\e[m\] "
export PROMPT_COMMAND='GIT_PS1_SHOWCOLORHINTS=1 __git_ps1 "${PS1_pre}" "${PS1_post}"'

alias ls='ls -hNFT 0 --color=auto'
alias ll='ls -l'
alias lla='ls -la'
alias lt='ls -ltr'
alias l1='/bin/ls -1hNT 0 --color=auto'
alias s='cd ..'


