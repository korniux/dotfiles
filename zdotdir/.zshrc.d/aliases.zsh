# eza

if [[ "$(which eza)" ]];
then
  alias ls='eza'                                                         # ls
  alias l='eza -lbF --git'                                               # list, size, type, git
  alias ll='eza -lbGF --git'                                             # long list
  alias llm='eza -lbGF --git --sort=modified'                            # long list, modified date sort
  alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
  alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
fi
