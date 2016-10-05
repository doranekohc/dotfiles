#
# .bashrc : script for bash settings
#

# -- .zshrcからではなく直接本ファイルが読み込まれた場合 -------------------
if [ "$1" != "from_zshrc" ]; then

  # git-prompt
  if [ -e /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh ]; then
    echo "exec git-prompt.sh..."
    . /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
  else
    echo "git-prompt is not found."
  fi

  GIT_PS1_SHOWDIRTYSTATE=true

  # プロンプト設定
  CURRENT_HOST=`hostname -s`
  if [ ${CURRENT_HOST} == "yoshii-MBP" ]; then
    export PS1="\]\n\[\e[32m\]\u \[\e[33m\]\w\[\e[1;30m\]\$(__git_ps1) `[[ ${VIM} ]] && echo '[vim]'`\n\[\e[3$((RANDOM%8))m\]>\[\e[3$((RANDOM%8))m\]>\[\e[3$((RANDOM%8))m\]>\[\e[0m\] "
  else
    export PS1="\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[1;30m\]\$(__git_ps1) `[[ ${VIM} ]] && echo '[vim]'`\n\[\e[3$((RANDOM%8))m\]>\[\e[3$((RANDOM%8))m\]>\[\e[3$((RANDOM%8))m\]>\[\e[0m\] "
  fi

  # completion for bash
  if [ -e /usr/local/Cellar/bash-completion/1.3/etc/bash_completion ]; then
    echo "exec bash_completion..."
    . /usr/local/Cellar/bash-completion/1.3/etc/bash_completion
  else
    echo "bash_completion is not found."
    alias __git_ps1=:
  fi

  # completion for git
  if [ -e /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash ]; then
    echo "exec git-completion.bash..."
    . /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
  elif [ -e ~/.git-completion.bash ]; then
    echo "exec git-completion.bash..."
    . ~/.git-completion.bash
  else
    echo "git-prompt is not found."
  fi

# -- .zshrcから読み込まれた場合 -------------------------------------------
else
  : #noop
fi
# -------------------------------------------------------------------------

# シェルをviモードに
#set -o vi

# PATH
export PATH=$HOME/.cabal/bin:/usr/local/bin:/usr/local/Cellar:/usr/local/development/bin:$PATH
export PATH=$PATH:/usr/local/Cellar/mysql/5.6.23/bin
export DYLD_LIBRARY_PATH=/usr/local/Cellar/mysql/5.6.23/lib:$DYLD_LIBRARY_PATH

# alias
alias ls='ls -FG'  #G=colorize
alias ll='ls -la'
alias llh='ls -lah'
alias rm='rm -i'
alias bashrc='vim ~/.bashrc'
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias vag='vagrant'
alias vis="vim -S ~/Session.vim"

alias mvim='open -a MacVim'

# alias for git
alias gimdiff='git difftool --tool=vimdiff --no-prompt'
alias gs='git status'
alias gis='git status'
alias gc='git checkout'

# enable Ctrl-S at bash.
stty stop undef

# 連続して実行された同じコマンドをhistoryに残さない
export HISTCONTROL=ignoreboth

# 拡張find
alias xfind='find . -type f | xargs grep'

# Elastic Beanstalk
export PATH=/usr/local/aws/eb/macosx/python2.7/:$PATH
export AWS_CREDENTIAL_FILE="~/.elasticbeanstalk/aws_credential_file"

# rbenv
export PATH=~/.rbenv/shims:$PATH

# tmux
alias tmux="TERM=screen-256color-bce tmux"

# NeoVim
export XDG_CONFIG_HOME=$HOME/.config
export TERM="xterm-256color"

# direnv
export EDITOR=vim
eval "$(direnv hook bash)"

# for go-lang
export GOPATH="${HOME}/.go"

# -----------------------------------------------------
# ココマデ
# -----------------------------------------------------
# マシン特有の設定は別ファイルに書く
if [ -e ~/.bashrc_local ]
then
  source ~/.bashrc_local
fi
