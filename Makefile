.PHONY: zsh nvim

macos:
	brew jandedobbeleer/oh-my-posh/oh-my-posh eza

linux:
	sudo pacman -S --needed base-devel eza neovim unzip
	git clone https://aur.archlinux.org/yay-bin.git
	cd yay-bin; makepkg -si
	rm -rf yay-bin

zsh:
	rm -r ${HOME}/.zshrc.d | true
	ln -nsf ${PWD}/zsh/.* ${HOME}/
