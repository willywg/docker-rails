# Setup

1. `git clone git@github.com:willywg/docker-rails.git .`
2. `rm -rf .git`
3. `docker-compose build`
4. `docker-compose run rails yarn install`
5. `docker-compose run rails bundle install`
6. `docker-compose run rails rails db:create`
7. `docker-compose up`
8. `git init`
