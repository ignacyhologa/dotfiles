# initialise plugins
source $ZPLUGINSDIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZPLUGINSDIR/zsh-autosuggestions/zsh-autosuggestions.zsh

alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias zshcfg="open -t $ZDOTDIR/.zshrc"
alias reload='source $ZDOTDIR/.zshrc'
alias update_homebrew="brew update; brew upgrade; brew upgrade --cask; brew cleanup --prune=all"

PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{103}%~%f%b %# '

# fzf autocompletions and key bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

chpwd() ls -F
alias md="mkdir -p"
alias ls="ls -F"
alias la="ls -AGlt"
alias rf='rm -rfv'
alias grep="grep --color=always"

# Jupyter notebook
alias jn="jupyter notebook"
alias jnd="jupyter nbextension disable connector-jupyter --py --sys-prefix"
alias jne="jupyter nbextension enable connector-jupyter --py --sys-prefix"
alias jni="jupyter nbextension install connector-jupyter --py --sys-prefix"

# mstrio
alias integration='python -m unittest /Users/ihologa/Documents/work/mstrio-py/production/tests/integration/test_suites/broad_integration_regression.py; python -m unittest /Users/ihologa/Documents/work/mstrio-py/production/tests/integration/test_suites/narrow_integration_regression.py'

# Used for pyenv
eval "$(pyenv init -)"
pyenv shell 3.9.1

# Used for rbenv
eval "$(rbenv init -)"
