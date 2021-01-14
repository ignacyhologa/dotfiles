# export ZSH="$HOME/.oh-my-zsh"
# export PATH="/usr/local/bin/python3:$PATH"

# plugins=(git)
# ZSH_THEME="random"
# source $ZSH/oh-my-zsh.sh
# eval "$(starship init zsh)"


chpwd() ls -F

alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

alias ls="ls -F"
alias la="ls -AGlt"
alias rf='rm -rfv'

alias reload='source $ZDOTDIR/.zshrc'
alias zshcfg="open -t $ZDOTDIR/.zshrc"

alias jn="jupyter notebook"
alias jnd="jupyter nbextension disable connector-jupyter --py --sys-prefix"
alias jne="jupyter nbextension enable connector-jupyter --py --sys-prefix"
alias jni="jupyter nbextension install connector-jupyter --py --sys-prefix"
alias integration='python -m unittest /Users/ihologa/Documents/work/mstrio-py/production/tests/integration/test_suites/broad_integration_regression.py; python -m unittest /Users/ihologa/Documents/work/mstrio-py/production/tests/integration/test_suites/narrow_integration_regression.py'


# Used For pyenv
eval "$(pyenv init -)"
pyenv shell 3.9.1
