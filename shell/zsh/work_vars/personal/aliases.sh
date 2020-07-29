alias cd..='cd ../' # Go back 1 directory level (for fast typers)
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .3='cd ../../../'    # Go back 3 directory levels
alias .4='cd ../../../../' # Go back 4 directory levels
alias .5='cd ../../../../../'   # Go back 5 directory levels
alias .6='cd ../../../../../../'  # Go back 6 directory levels


alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get update && sudo apt-get upgrade'


alias gs='git status '
alias ga='git add '
alias gaa='git add -A'
alias gb='git branch '
alias gbv='git branch -vv'
alias gc='git commit'
alias gcm='git commit -m'
alias gcmS='git commit -S -m'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log --all --graph --decorate --oneline'
alias gll="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias p='git pull'
alias gp='git push'
alias gm='git merge'
alias gr='git remote'

alias d='docker'
alias kc='kubectl'

alias e="exit"
alias c="clear"



# env vars
export MISSIONCONTROL=${HOME}/my_setup
export SOURCEDIR=${HOME}/src
export SCRIPTDIR=$MISSIONCONTROL/scripts
export PATH=${HOME}/bin:${SCRIPTDIR}/bin:$PATH

alias msc="cd ${MISSIONCONTROL}"
alias src_="cd ${SOURCEDIR}"

GITOPTIONS="--git-dir $MISSIONCONTROL/.git/ --work-tree $MISSIONCONTROL/"
alias mpush="git $GITOPTIONS add -A; git $GITOPTIONS commit -m 'updating'; git $GITOPTIONS push;"
alias mgs="git $GITOPTIONS status"

# project vars
export DOCKER_NETWORK_NAME="codexetreme_dev"

#only used for homebrew on macOS
export PATH=/usr/local/opt/inetutils/libexec/gnubin:$PATH