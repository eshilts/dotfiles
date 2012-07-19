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

# --- Copied from pose.bash to give custom colors --- #
# This stuff will give you a fancy-dancy prompt that includes the
# svn trunk/tags/branches part of the URL in it so you will always know
# where you are working in Subversion.
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

function command_exists() {
    command -v "$1" &> /dev/null
}

function spwd() {
    stat .svn > /dev/null 2>&1
    if [ "$?" == "0" ]; then
        SURL=`svn info | grep URL | head -1 | perl -pe 's/URL: (.*)/\1/'`
        if [ `echo ${SURL} | grep -E "branches|tags"` ]; then
            SVER=`echo ${SURL} | perl -pe 's{.*/(branches|tags)/(.*)}{\1/\2}' | cut -d/ -f1-2`
            SPTH=`echo ${SURL} | perl -pe 's{.*svnroot/(.*)/(branches|tags)/.*}{/\1}'`
            SPWD="${SPTH}/${SVER}"
            SCL=$PROMPT_GREEN
        else
            SPWD=`echo ${SURL} | perl -pe 's{.*svnroot/(.*)/trunk(.*)}{/\1/trunk}'`
            SCL=$PROMPT_YELLOW
        fi
        export PS1="${PROMPT_YELLOW}\u:\w ${SCL}[SVN: $SPWD]\n${PROMPT_YELLOW}$ ${PROMPT_NO_COLOR}"
    # Requires git-completion.bash to do anything useful.
    elif command_exists __git_ps1; then
	GITBRANCH=`__git_ps1 "%s"`
	if [[ "${GITBRANCH}" != "" ]]; then
    if [[ "${GITBRANCH}" == "master" ]]; then
      export PS1="${PROMPT_CYAN}\u:\w [git: $GITBRANCH] $ ${PROMPT_NO_COLOR}"
    else 
      export PS1="${PROMPT_RED}\u:\w [git: $GITBRANCH] $ ${PROMPT_NO_COLOR}"
    fi
	else
	    export PS1="\u:\w $ "
	fi
    else
        export PS1="\u:\w $ "
    fi
}

if [ -z $NO_SVN_PROMPT ]; then
    export PROMPT_COMMAND=spwd
fi
# --- End of copied from pose.bash to give custom colors --- #

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
