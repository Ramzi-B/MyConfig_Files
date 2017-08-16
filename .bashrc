#
# ~/.bashrc
#

### Blackarch Linux Setting ###

# colors
darkgrey="$(tput bold ; tput setaf 0)"
white="$(tput bold ; tput setaf 7)"
red="$(tput bold ; tput setaf 1)"
nc="$(tput sgr0)"

# exports
export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:"
export PATH="${PATH}/opt/bin:/usr/bin/core_perl:/usr/games/bin:"
export PS1="\[$darkgrey\][ \[$red\]hackawax \[$white\]\W\[$red\] \[$darkgrey\]]\\[$red\]# \[$nc\]"
export LD_PRELOAD=""
export EDITOR="vim"
export VISUAL="vim"

screenfetch

# alias
alias ls="ls --color"
#alias vi="vim"
alias shred="shred -zf"
alias python="python2"
alias wget="wget -U 'noleak''"
alias curl="curl --user-agent 'noleak'"

# sources files
[ -r /usr/share/bash-completion/completions ] &&
  . /usr/share/bash-completion/completions/*

# xterm transparency
[ -n "$XTERM_VERSION" ] && transset-df -a >/dev/null

# ssh-agent
if ! pgrep -u $USER ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval $(<~/.ssh-agent-thing)
fi
ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
