. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc

# RVM
[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm

# tasks management
[[ -f ~/Dropbox/SSP/Tasks/setup_aliases.sh ]] && source ~/Dropbox/SSP/Tasks/setup_aliases.sh

