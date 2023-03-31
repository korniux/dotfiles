.PHONY: zsh nvim

zsh:
	rm -r ${HOME}/.zshrc.d | true
	ln -nsf ${PWD}/zsh/.z* ${HOME}/

nvim:
	ln -nsf ${PWD}/nvim ${HOME}/.config

