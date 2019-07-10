#!/bin/bash

echo '----Starting Webpack----'

rm -rf /app/public/packs
touch app/webpack/packs/application.js
# bundle exec webpack-dev-server
bin/webpack-dev-server
# bin/webpack --watch --colors --progress
