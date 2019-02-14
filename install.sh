#!/usr/bin/env bash

PLATFORM="$(uname)"

cat << EOF
##  ##
## ##         ##
####   ##  ##  #
## ##    ##    configs for
##  ## ##  ##  $PLATFORM

EOF

function zshInstall() {
    echo "Installing zsh"
    case "$PLATFORM" in
        Darwin)
            brew install zsh
            ;;
        Linux)
            sudo apt-get -y install zsh
            ;;
    esac
    echo "Installing oh-my-zsh plugin"
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    echo "Installing syntax highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "Copying configuration"
    yes | cp -rf $PWD/.zshrc ~/
    echo "$(which zsh) SUCCESS"
}

function vimInstall() {
    echo "Installing vim\'s pathogen"
    mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    echo "Installing plugins"
    cd ~/.vim/bundle
    git clone https://github.com/itchyny/lightline.vim.git
    git clone https://github.com/itchyny/vim-gitbranch.git
    echo "Copying configuration"
    yes | cp -rf .vimrc ~/
    echo "$(which vim) SUCCESS"
}

function usage() {
    echo "Usage: ./install.sh [-h] [--zsh] [--vim]"
}

if [ "$1" == "" ];
    then
        usage
fi

while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        --zsh)
            zshInstall
            ;;
        --vim)
            vimInstall
            ;;
        -h)
            usage
            exit
            ;;
        *)
            echo "Invalid argument."
            usage
            exit 1
            ;;
    esac
    shift
done

