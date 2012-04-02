source ~/.zsh/config
source ~/.zsh/aliases
source ~/.zsh/completion

# Plugins
for plugin_file (~/.zsh/plugins/*.zsh) source $plugin_file

# Colors
autoload -U colors
colors
setopt prompt_subst

# Prompt
local result="%(?,%{$fg[green]%}✓%{$reset_color%},%{$fg[red]%}✗%{$reset_color%})"

PROMPT='${result} %~%{$reset_color%} » '
RPROMPT='%{$fg[white]%} $(~/bin/git-cwd-info)%{$reset_color%}'

# Replace the above with this if you use rbenv
# RPROMPT='%{$fg[white]%} $(~/.rbenv/bin/rbenv version-name)$(~/bin/git-cwd-info.rb)%{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

