.PHONY: zsh font deps

install: deps zsh font

deps:
	brew install mise eza starship

zsh:
	ln -s ${PWD}/.zshenv ${HOME}/.zshenv
	ln -s ${PWD}/zdotdir ${HOME}/.config/zsh

font:
	brew tap homebrew/cask-fonts
	brew install --cask font-jetbrains-mono-nerd-font
