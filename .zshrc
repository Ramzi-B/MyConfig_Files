export ZSH=/home/hackawax/.dotfiles/oh-my-zsh
export SHELL='/bin/zsh'
export EDITOR='vim'
export VISUAL='vim'

#export HISTTIMEFORMAT='%F %T : '

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)"
fi

#screenfetch | lolcat
screenfetch

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="xiong-chiamiov-plus"
#ZSH_THEME="agnoster"
#ZSH_THEME="ys"
#ZSH_THEME="gentoo"
#SH_THEME="bira"
ZSH_THEME="juanghurtado"
#ZSH_THEME="theunraveler"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux npm gulp)

# User configuration

export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/opt/bin:/usr/bin/core_perl:/usr/games/bin:"

# Ruby
export PATH="${PATH}:/home/hackawax/.gem/ruby/2.4.0/bin"

# Java
export _JAVA_AWT_WM_NONREPARENTING=1

# Composer
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

#export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=fr_FR.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias wget="wget -U 'noleak''"
alias curl="curl --user-agent 'noleak'"
alias shred="shred -zf"

alias kall="killall"

alias cky="conky"
alias kcky="killall conky"

alias news="newsboat"
alias vbox="virtualbox -style gtk2"

alias ll="ls -larth"
alias lc="ls -a"
alias tch="touch"
alias cls="clear"

alias vi="vim"
alias svi="sudo vim"

# Mirrorlist
alias reflect="sudo reflector --verbose --country 'France' -l 30 -p http --sort rate --save /etc/pacman.d/mirrorlist"

# Clean up
alias rmcache="rm -rfv .cache/*"
alias rmthumb="rm -rfv .thumbnails/*"
alias bv="browser-vacuum"

# Clamscan
alias fresh="sudo freshclam"
alias clamav="clamscan -r -i --exclude-dir='^/sys|^/proc|^/dev|^/lib|^/bin|^/sbin' /"
alias clamove="clamscan --recursive=yes --infected --remove --exclude-dir='^/sys|^/proc|^/dev|^/lib|^/bin|^/sbin' /"
alias claminf="clamscan --recursive=yes --infected --exclude-dir='^/sys|^/proc|^/dev|^/lib|^/bin|^/sbin' /"

# Journalctl
alias jctlxe="journalctl -xe"
alias jctlxn="journalctl -xn"
alias jctlf="journalctl -f"

# Systemctl
alias sctllsa="systemctl -lt service --all"
alias sctlfa="systemctl --failed --all"
alias sctlf="systemctl --failed"
alias sctlluf="systemctl list-unit-files"
alias sctltyp="systemctl --type=service"

# Yaourt
alias yaqma="yaourt -Qma"
alias yac="yaourt -C"
alias yasts="yaourt --stats"
alias orphan="yaourt -Qdt"

# All apps
alias cpkglst="pacman -Qqe | grep -vx \"$(pacman -Qqm)\" > /home/hackawax/Desktop/pkg.list"

# Net
alias sntstp="sudo netstat -tp"
alias sdump="sudo tcpdump"
alias srape="sudo etherape"
alias ipa="ip -c address show"

# AUR update
alias aurup="yaourt -Syu --devel --aur"

# Start | Stop lampp server
alias lppstart="sudo /opt/lampp/lampp start"
alias lppstop="sudo /opt/lampp/lampp stop"

# Start | Stop apache & mysql
alias startserver="systemctl start httpd.service && systemctl start mysqld.service"
alias stopserver="systemctl stop httpd.service && systemctl start mysqld.service"

# Ranger
alias r="ranger"
alias sr="sudo ranger"

# Pacman
alias rpi="pacman -Qs"
alias rpd="pacman -Ss"

# zsh
alias sozh="source .zshrc"

# Microcode
alias mcode="dmesg | grep microcode"

# macchanger
alias mac="sudo macchanger -A enp5s0"

# generer mot de passe
alias gpwd="</dev/urandom tr -dc '12345@#$%^&*(){}_A-Z-a-z-0-9'| fold -w10 | head -10"
alias gpwd15="</dev/urandom tr -dc '12345@#$%^&*(){}_A-Z-a-z-0-9'| fold -w15 | head -10"

# in case of 'Error: watch' with npm
alias ewnpm="echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p"
