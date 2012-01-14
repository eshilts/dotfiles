source ~/.bashrc
export CLICOLOR=1

# useful aliases
# - git
alias ga='git add'
alias gc='git commit -m'
alias gs='git status'
alias gpgm='git push github master'
alias gpom='git push opower master'
# - programs
alias octave='exec /Applications/Octave.app/Contents/Resources/bin/octave'
# - Moving around
alias ws='cd $workspace && ls'
alias home='cd ~'
# - ls
alias la='ls -alh'         # list all in human readable
alias ld='ls -d */'        # list only subdirectories in current directory
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
# - opower servers
alias biin001='ssh biin001.va.opower.it'
alias biin='biin001'

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'$*'*' -ls ; }
