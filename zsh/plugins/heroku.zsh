heroku_with_app () {
  if [ $1 = "console" ]; then
    if [ -f "Jakefile.coffee" ]; then
      argv[1]=(run 'node_modules/.bin/jake console')
    else
      argv[1]=(run console)
    fi
  fi
  _run-with-bundler heroku "$@"
}

testing () {
  heroku_with_app "$@" --app $(basename $(pwd))-testing
}

investigation () {
  heroku_with_app "$@" --app $(basename $(pwd))-investigation
}

staging () {
  heroku_with_app "$@" --app $(basename $(pwd))-staging
}

production () {
  heroku_with_app "$@" --app $(basename $(pwd))
}

