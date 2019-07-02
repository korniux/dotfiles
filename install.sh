#!/usr/bin/env bash

PLATFORM="$(uname)"
CURRENT_FOLDER="$PWD"

cat << EOF
##  ##
## ##         ##
####   ##  ##  # 
## ##    ##      configs for $PLATFORM
##  ## ##  ##    revision of $(git log -1 --format=%cd)

EOF

function zshInstall() {
    if [ `which zsh` == "" ];
    then
        echo "#### Installing zsh"
        case "$PLATFORM" in
            Darwin)
               brew install zsh
               ;;
            Linux)
               sudo apt-get -y install zsh
               ;;
        esac
    fi
    echo "#### Copying configuration"
    yes | cp -f $PWD/.zshrc $HOME/
    if [ ! -d $HOME/.oh-my-zsh  ];
    then
        echo "#### Installing oh-my-zsh plugin"
        sh -c "$(curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
    echo "#### Installing syntax highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    if [ `which pip3` != "" ];
    then
        echo "### Installing thefuck"
        pip3 install thefuck
    fi

    echo "#### $(which zsh) SUCCESS"
}

function vimInstall() {
    echo "#### Installing pathogen"
    mkdir -p $HOME/.vim/autoload ~/.vim/bundle
	curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    echo "#### Copying configuration"
    yes | cp -f $PWD/.vimrc $HOME/
    echo "#### Installing plugins"
    cd $HOME/.vim/bundle
    git clone https://github.com/itchyny/lightline.vim.git
    git clone https://github.com/itchyny/vim-gitbranch.git
    echo "#### $(which vim) SUCCESS"
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

