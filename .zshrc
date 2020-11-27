# 環境変数
export LANG=ja_JP.UTF-8

# パスを追加したい場合
export PATH="$HOME/bin:$PATH"

# nodebrewのパス追加
NODEBREW_HOME=/usr/local/var/nodebrew/current
export NODEBREW_HOME
export NODEBREW_ROOT=/usr/local/var/nodebrew
export PATH=$PATH:$NODEBREW_HOME/bin

# 色を使用
autoload -Uz colors
colors

# 補完
autoload -Uz compinit
compinit

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

# ここはプロンプトの設定なので今回の設定とは関係ありません
if [ $UID -eq 0 ];then
# ルートユーザーの場合
PROMPT="%F{red}%d%f "
else
# ルートユーザー以外の場合
PROMPT="%F{cyan}%d%f "
fi


# ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    # gitで管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全てcommitされてクリーンな状態
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # gitに管理されていないファイルがある状態
    branch_status="%F{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git addされていないファイルがある状態
    branch_status="%F{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commitされていないファイルがある状態
    branch_status="%F{yellow}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{red}!(no branch)"
    return
  else
    # 上記以外の状態の場合は青色で表示させる
    branch_status="%F{blue}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}[$branch_name]"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側(RPROMPT)にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'


# global  alias
alias -g L='| less'
alias -g M='| more'
alias -g G='| grep'
alias -g C='| pbcopy'
alias -g A='| awk'

#alias
alias ll='ls -alG'
alias nocell='cd ~/develop/nocell'

# docker
alias dcub='docker-compose up -d --build'
alias dcd='docker-compose down'
alias doe='docker exec -it'

# git
alias gag='git add .'
alias gcg='git commit -m'
alias gpg='git push origin'
alias gbg='git branch'
alias gchg='git checkout'
alias gsg='git stash'
alias grg='git remote prune origin'


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="~/.sdkman"
[[ -s "~/.sdkman/bin/sdkman-init.sh" ]] && source "~/.sdkman/bin/sdkman-init.sh"
