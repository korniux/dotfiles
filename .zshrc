export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git httpie zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export EDITOR=vim

export PATH=$HOME/.local/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="/home/korniux/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ `which thefuck` != "" ] && eval $(thefuck --alias)

# TTL Change for greedy mobile providers
alias ttlish="sudo sysctl net.ipv4.ip_default_ttl=64"

# Git after conflict resolution
alias gitresovle="git commit -a --no-edit && git push"

