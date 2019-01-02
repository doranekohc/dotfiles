##################################################
## Prompt
##################################################

# git-prompt
if [ -e /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh ]; then
  . /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
else
  echo "git-prompt is not found."
  alias __git_ps1=:
fi

GIT_PS1_SHOWDIRTYSTATE=true

# bash PS1
CURRENT_HOST=`hostname -s`
if [ ${CURRENT_HOST} == "yoshii-MBP" ]; then
  export PS1="\]\n\[\e[32m\]\u \[\e[33m\]\w\[\e[1;30m\]\$(__git_ps1) `[[ ${VIM} ]] && echo '[vim]'`\n\[\e[3$((RANDOM%8))m\]>\[\e[3$((RANDOM%8))m\]>\[\e[3$((RANDOM%8))m\]>\[\e[0m\] "
else
  export PS1="\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[1;30m\]\$(__git_ps1) `[[ ${VIM} ]] && echo '[vim]'`\n\[\e[3$((RANDOM%8))m\]>\[\e[3$((RANDOM%8))m\]>\[\e[3$((RANDOM%8))m\]>\[\e[0m\] "
fi


##################################################
## Completion
##################################################

# bash
if [ -e /usr/local/Cellar/bash-completion/1.3/etc/bash_completion ]; then
  . /usr/local/Cellar/bash-completion/1.3/etc/bash_completion
else
  echo "bash_completion is not found."
fi

# git
if [ -e /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash ]; then
  . /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
elif [ -e ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
else
  echo "git-prompt is not found."
fi


##################################################
## alias
##################################################

alias ls='ls -FG'  #G=colorize
alias ll='ls -la'
alias llh='ls -lah'
alias rm='rm -i'
alias bashrc='vim ~/.bashrc'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias vag='vagrant'
alias vis="vim -S ~/Session.vim"

# alias for app
alias mvim='open -a MacVim'

# alias for git
alias gimdiff='git difftool --tool=vimdiff --no-prompt'
alias gimdiffm='git difftool --tool=mvimdiff --no-prompt'
alias mgimdiff='git difftool --tool=mvimdiff --no-prompt'

# alias for Docker
alias dockerm='docker-machine'
alias dockerc='docker-compose'


##################################################
## Other
##################################################

# PATH
export PATH=$HOME/.cabal/bin:/usr/local/bin:/usr/local/Cellar:/usr/local/development/bin:$PATH
export PATH=$PATH:/usr/local/Cellar/mysql/5.6.23/bin
export DYLD_LIBRARY_PATH=/usr/local/Cellar/mysql/5.6.23/lib:$DYLD_LIBRARY_PATH

# enable Ctrl-S at bash.
stty stop undef

# 連続して実行された同じコマンドをhistoryに残さない
export HISTCONTROL=ignoreboth

# rbenv
export PATH=~/.rbenv/shims:$PATH

# tmux
alias tmux="TERM=screen-256color-bce tmux"

# NeoVim
export XDG_CONFIG_HOME=$HOME/.config
export TERM="xterm-256color"

# MacVim
export PATH=${PATH}:/Applications/MacVim.app/Contents/MacOS

# direnv
export EDITOR=vim
eval "$(direnv hook bash)"

# for golang
export GOROOT=`go env GOROOT`
export GOPATH="${HOME}/go"
export PATH="${PATH}:${GOPATH}/bin"

# gitignore generator
function gi() { curl https://www.gitignore.io/api/${@} ;}

# node関連
export PATH=${HOME}/.nodebrew/current/bin:${PATH}:./node_modules/.bin

# elasticsearch (high priority)
export PATH=/usr/local/opt/elasticsearch@5.6/bin:${PATH}

##################################################
## Cloud Settings
##################################################

# Elastic Beanstalk
export PATH=/usr/local/aws/eb/macosx/python2.7/:$PATH
export AWS_CREDENTIAL_FILE="~/.elasticbeanstalk/aws_credential_file"

# Google Cloud Platform
## The next line updates PATH for the Google Cloud SDK.
source '/usr/local/google-cloud-sdk/path.bash.inc' # auto-add
## The next line enables shell command completion for gcloud.
source '/usr/local/google-cloud-sdk/completion.bash.inc' # auto-add
export PATH=/usr/local/go_appengine:${PATH}


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash

# android debug
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
