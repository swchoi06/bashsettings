if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

function parse_git_branch () 
{
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/:\1/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\u@$HOSTNAME$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "

if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
fi

alias vi='vim'
alias la='ls -Alh'
alias l='ls -CF'
alias rm='rm -i'
alias mv='mv -i'

# Custom alias
alias sshcargo='ssh swchoi06@211.249.50.61'
alias sshcamdal='ssh swchoi06@211.249.50.56'

# Disable internal keybaord
if [ "$(uname)" == "Darwin" ]; then
  alias ukyb 'sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/'
  alias lkyb 'sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/'
fi

export CLICOLOR=1
export LSCOLORS=exfxcxdxcxegedabagacad
export LS_OPTIONS='--color=auto'
export GREP_OPTIONS='--line-number --color=auto --binary-files=without-match'
export GREP_COLOR='1;32'
export PATH=$PATH:/usr/local/bin:.
export LC_ALL="ko_KR.UTF-8"
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"     
export LESS=' -R '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
