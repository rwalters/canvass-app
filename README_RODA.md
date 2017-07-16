# CanvassApp

## dry-app-roda
This app uses dry-web-roda. For details, please see [dry-web](https://github.com/dry-rb/dry-web) and
[roda](https://github.com/jeremyevans/roda) documentation.

### First steps

1. Run `bundle`
1. Review `.env` & `.env.test` (and make a copy to e.g. `.example.env` if you want example settings checked in)
1. Create a `<app>_development` database
1. Add your own steps to `bin/setup`
1. Run the app with `bundle exec shotgun -p 3000 -o 0.0.0.0 config.ru`
1. Initialize git with `git init` and make your initial commit

## Docker

This project is set up to use [Docker](https://docs.docker.com/) and [Docker Compose](https://docs.docker.com/compose/)
