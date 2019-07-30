export PATH="/usr/local/bin:$PATH"
export PATH=$PATH:$HOME/.zplug/repos/powerline/powerline/scripts/
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




# zplug "sindresorhus/pure"
zplug "zsh-users/zsh-syntax-highlighting"
# history関係
zplug "zsh-users/zsh-history-substring-search"
# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"

if [ ! ~/.zplug/last_zshrc_check_time -nt ~/.zshrc ]; then
    touch ~/.zplug/last_zshrc_check_time
    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi
fi




# alias
alias -g L='| less'
alias -g M='| more'
alias -g G='| grep'
alias -g C='| pbcopy'
alias -g A='| awk'
alias ll='ls -alG'
alias wiA5='wine /Users/hashinaoki/Downloads/a5m2_2.14.1_x86/A5M2.exe'


# move
alias pj='cd /develop/projects'
alias akn='cd /develop/projects/anken'


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


# terraform
alias terin='terraform init'
alias terpl='terraform plan'




zplug load
