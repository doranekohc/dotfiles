# 補完機能有効
autoload -U compinit
compinit

# LS_COLORSを設定しておく
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# 補完候補からTABで選択
zstyle ':completion:*:default' menu select

### プロンプト
setopt prompt_subst
autoload -U colors; colors

# prompt like cygwin
PROMPT="
${fg[green]}%n@%m ${fg[yellow]}%~
${fg[white]}\$ "

# 右
RPROMPT='[zsh]'

# zsh特有の設定以外は.bashrcから読み込む
# 引数に from_zshrc を付けることで.bashrc内での分岐に使う
source ~/.bashrc from_zshrc
