export ZSH="$HOME/.oh-my-zsh"
export LC_ALL=en_US.UTF-8
# export PATH="/usr/local/bin/python3:$PATH"
export VISUAL=/usr/local/bin/code

plugins=(git)
ZSH_THEME="random"
source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"


# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
#if [[ "${terminfo[kcuu1]}" != "" ]]; then
#	autoload -U up-line-or-beginning-search
#	zle -N up-line-or-beginning-search
#	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
#fi
# start typing + [Down-Arrow] - fuzzy find history backward
#if [[ "${terminfo[kcud1]}" != "" ]]; then
#	autoload -U down-line-or-beginning-search
#	zle -N down-line-or-beginning-search
#	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
#fi

chpwd() ls -F

alias config='/usr/bin/git --git-dir=/Users/ihologa/.cfg/ --work-tree=/Users/ihologa'
alias jn="jupyter notebook"
alias jnd="jupyter nbextension disable connector-jupyter --py --sys-prefix"
alias jne="jupyter nbextension enable connector-jupyter --py --sys-prefix"
alias jni="jupyter nbextension install connector-jupyter --py --sys-prefix"
alias integration='python -m unittest /Users/ihologa/Documents/work/mstrio-py/production/tests/integration/test_suites/broad_integration_regression.py; python -m unittest /Users/ihologa/Documents/work/mstrio-py/production/tests/integration/test_suites/narrow_integration_regression.py'
#alias python="python3"
#alias pip="pip3"

alias ls="ls -F"
alias rf='rm -rf'

alias reload='source ~/.zshrc'
alias zshcfg="open -t ~/.zshrc"


gamp() {
        gaa
        gcmsg $1
        gp
}

put() {
        touch $1
        v $1
    }

take() {
        mkdir $1
        cd $1
}


# Used For pyenv
eval "$(pyenv init -)"
pyenv shell 3.9.0
