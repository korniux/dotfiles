depends:
	ifeq ($(uname), "Darwin")
		brew install httpie
	endif
	ifeq ($(uname), "Linux")
		sudo apt-get install httpie 
	endif

init_zsh:
	ifeq ($(uname), "Darwin")
		brew install zsh
	endif
	ifeq ($(uname), "Linux")
		sudo apt-get install zsh
	endif
	sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	mv ~/.zshrc ~/.zshrc-backup
	yes | cp -rf .zshrc ~/

init_vim:
	mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
	git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim
	yes | cp -rf .vimrc ~/

update:
	yes | cp -rf .zshrc ~/
	yes | cp -rf .vimrc ~/

