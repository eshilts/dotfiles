# --- Copied from pose.bash to give custom colors --- #
# This stuff will give you a fancy-dancy prompt that includes the
# svn trunk/tags/branches part of the URL in it so you will always know
# where you are working in Subversion or Git.
PROMPT_NO_COLOR="\[\033[0m\]"
PROMPT_BLACK="\[\033[1;30m\]"
PROMPT_BOLD_RED="\[\033[1;31m\]"
PROMPT_BOLD_GREEN="\[\033[1;32m\]"
PROMPT_BOLD_YELLOW="\[\033[1;33m\]"
PROMPT_BOLD_CYAN="\[\033[1;34m\]"
PROMPT_BOLD_MAGENTA="\[\033[1;35m\]"
PROMPT_BOLD_GREY="\[\033[1;36m\]"
PROMPT_BOLD_WHITE="\[\033[1;37m\]"
PROMPT_RED="\[\033[0;31m\]"
PROMPT_GREEN="\[\033[0;32m\]"
PROMPT_YELLOW="\[\033[0;33m\]"
PROMPT_CYAN="\[\033[0;34m\]"
PROMPT_MAGENTA="\[\033[0;35m\]"
PROMPT_TEAL="\[\033[0;36m\]"
PROMPT_WHITE="\[\033[0;37m\]"

# Set my custom Git colors
GIT_MASTER_COLOR=$PROMPT_CYAN
GIT_BRANCH_COLOR=$PROMPT_RED

# Source git completion and prompt stuff
source ~/.git-completion.bash
source ~/.git-prompt.sh
# Source .bashrc which sources pose.bash
source ~/.bashrc
export CLICOLOR=1
export workspace=~/workspace

# useful aliases
# - git
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit -am'
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
# - R related
alias R='R --no-save --no-restore-data --quiet'

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'$*'*' -ls ; }

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
