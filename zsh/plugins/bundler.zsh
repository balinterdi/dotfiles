# vendor everything still applies
# http://ryan.mcgeary.org/2011/02/09/vendor-everything-still-applies/
alias bi="bundle install --path vendor"
alias bo="bundle open"
alias bu="bundle update"
alias be="bundle exec"
alias binit="bundle install && bundle package && echo 'vendor/ruby' >> .gitignore"

# fpath=($ZSH/plugins/bundler $fpath) ??
autoload -U compinit
compinit -i

# The following is based on https://github.com/gma/bundler-exec
export BUNDLER_EDITOR=vim

bundled_commands=(annotate cap capify cucumber guard jekyll middleman nanoc rackup rainbows rake rails ruby rspec shotgun spec spork thin thor unicorn unicorn_rails)

## Functions

_bundler-installed() {
  which bundle > /dev/null 2>&1
}

_within-bundled-project() {
  local check_dir=$PWD
  while [ $check_dir != "/" ]; do
    [ -f "$check_dir/Gemfile" ] && return
    check_dir="$(dirname $check_dir)"
  done
  false
}

_run-with-bundler() {
  if _bundler-installed && _within-bundled-project; then
    bundle exec $@
  else
    $@
  fi
}

## Main program
for cmd in $bundled_commands; do
  eval "function bundled_$cmd () { _run-with-bundler $cmd \$@}"
  alias $cmd=bundled_$cmd

  if which _$cmd > /dev/null 2>&1; then
        compdef _$cmd bundled_$cmd=$cmd
  fi
done

