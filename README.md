# Setup

1. `git clone git@github.com:willywg/docker-rails.git .`
2. `rm -rf .git`
3. `docker-compose build`
4. `docker-compose run rails bundle install`
5. `docker-compose run rails rails db:create`
6. `docker-compose up`
7. `git init`
