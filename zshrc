source ~/.zsh/config
source ~/.zsh/aliases
source ~/.zsh/completion
source ~/.localrc

# Plugins
# for plugin_file (~/.zsh/plugins/*.zsh) source $plugin_file
plugins=(
  brew
  git
  osx
  rake
  rbenv
  ruby
)

# Colors
autoload -U colors
colors
setopt prompt_subst

# Prompt
local result="%(?,%{$fg[green]%}✓%{$reset_color%},%{$fg[red]%}✗%{$reset_color%})"

PROMPT='${result} %~%{$reset_color%} » '
# RPROMPT='%{$fg[white]%} $(~/bin/git-cwd-info)%{$reset_color%}'

# Replace the above with this if you use rbenv
RPROMPT='%{$fg[white]%} $(~/.rbenv/bin/rbenv version-name)$(git-cwd-info)%{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/balint/code/cardstack/dotbc-demo/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/balint/code/cardstack/dotbc-demo/node_modules/tabtab/.completions/electron-forge.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
