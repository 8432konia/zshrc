# 環境変数
export LANG=ja_JP.UTF-8

ZPLUG_SUDO_PASSWORD=
ZPLUG_PROTOCOL=ssh

source $HOME/.zplug/init.zsh

# zplug "b4b4r07/ultimate", as:theme
zplug "powerline/powerline", use:"powerline/bindings/zsh/powerline.zsh"
zplug 'b4b4r07/zplug-doctor', lazy:yes
zplug 'b4b4r07/zplug-cd', lazy:yes
zplug 'b4b4r07/zplug-rm', lazy:yes




zplug "sindresorhus/pure"
zplug "zsh-users/zsh-syntax-highlighting"
# history関係
zplug "zsh-users/zsh-history-substring-search"
# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"

# if ! zplug check --verbose; then
#    printf "Install? [y/N]: "
#    if read -q; then
#        echo; zplug install
#    fi
#    echo
# fi


# alias
alias -g L='| less'
alias -g M='| more'
alias -g G='| grep'
alias -g C='| pbcopy'
alias -g A='| awk'
alias ll='ls -alG'
alias pj='cd /develop/projects'

zplug load
