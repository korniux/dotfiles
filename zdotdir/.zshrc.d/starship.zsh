export STARSHIP_CONFIG=${ZDOTDIR}/starship.toml

[[ "$(which starship)" ]] && eval "$(starship init zsh)"
