#!/bin/zsh

initialize_repo() {
    echo ".cfg" >> .gitignore
    git clone -q --bare https://github.com/ignacyhologa/dotfiles.git $HOME/.cfg || return 1
    rm .gitignore || return 1
    alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
    cfg checkout || return 1
    cfg config --local status.showUntrackedFiles no || return 1
}

config_repo() {
    echo -n "INPUT: Git local user name: "
    read cfg_username
    [[ -z cfg_username ]] && return 1
    echo -n "INPUT: Git local user email: "
    read cfg_email
    [[ -z cfg_email ]] && return 1
    alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
    cfg config --local user.name "${cfg_username}"
    cfg config --local user.email "${cfg_email}"
}

install_core() {
    brew tap -q homebrew/cask-fonts || return 1
    brews=(${(f)"$(cat ~/.local/share/helpers/brew_list)"})
    for brew in ${brews}; do brew install -q ${brew} || return 1; done
}

install_cask() {
    brew_casks=($(cat ~/.local/share/helpers/brew_cask_list))
    for brew_cask in ${brew_casks}; do brew install --cask ${brew_cask}; done
}

install_pyenv() {
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    pyenv install -l | rg -v Available\ versions: | fzf | xargs -I{} sh -c "pyenv install {}; pyenv global {}" || return 1
}

install_venvs() {
    pyenv virtualenv $(pyenv global) base || return 1
    pip install -U pip setuptools wheel || return 1
    pyenv activate base || return 1
    pip install -U pip setuptools wheel || return 1
    pip install -r ~/.local/share/helpers/pip_list || return 1
    pyenv deactivate || return 1
}

resolve_conflicts() {
    sudo chown -R $(whoami) /usr/local/share/zsh || return 1
    sudo chmod -R 755 /usr/local/share/zsh || return 1
    sudo chown -R $(whoami) /usr/local/share/zsh/site-functions || return 1
    sudo chmod -R 755 /usr/local/share/zsh/site-functions || return 1
}

compile_term() {
    mkdir ~/.terminfo 2> /dev/null
    for file in ~/.local/share/terminfo/*(.); do tic -o ~/.terminfo ${file} || return 1; done
}

#echo "\nTASK: GIT #**********************************************************************\n"
#echo "[config] ..."
#config_repo || {echo "FAIL"; exit 1}
#echo "[config] ...OK"
#echo "[submodules] ..."
#cfg submodule -q update --init --recursive || {echo "FAIL"; exit 1}
#echo "[submodules] ...OK"

echo "\nTASK: HOMEBREW *****************************************************************\n"
echo "[core] ..."
install_core || {echo "FAIL"; exit 1}
echo "[core] ...OK"
echo "[cask] ..."
install_cask || {echo "FAIL"; exit 1}
echo "[cask] ...OK"

echo "\nTASK: PYTHON *******************************************************************\n"
echo "[pyenv] ..."
install_pyenv || {echo "FAIL"; exit 1}
echo "[pyenv] ...OK"
echo "[pyenv virtualenvs] ..."
install_venvs || {echo "FAIL"; exit 1}
echo "[pyenv virtualenvs] ...OK"

echo "\nTASK: ZSH **********************************************************************\n"
echo "[default] ..."
chsh -s /bin/zsh || {echo "FAIL"; exit 1}
echo "[default] ...OK"
echo "[zsh conflicts] ..."
resolve_conflicts || {echo "FAIL"; exit 1}
echo "[zsh conflicts] ...OK"
echo "[terminfo] ..."
compile_term || {echo "FAIL"; exit 1}
echo "[terminfo] ...OK"

exit 0