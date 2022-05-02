#!/bin/sh
set -e

composer install
npm install
npm run dev
php artisan migrate --seed
chown -R www-data:www-data storage bootstrap/cache
chmod -R 777 storage bootstrap/cache
service supervisor start
supervisorctl reread
supervisorctl update
supervisorctl start horizon:*

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- apache2-foreground "$@"
fi

exec "$@"
