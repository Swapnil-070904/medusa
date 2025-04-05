#!/bin/bash
set -e

echo "🔁 Running DB migrations..."

echo "DATABASE_URL=$DATABASE_URL" > .env
echo "JWT_SECRET=$JWT_SECRET" >> .env
echo "COOKIE_SECRET=$COOKIE_SECRET" >> .env
echo "NODE_TLS_REJECT_UNAUTHORIZED=0" >> .env
echo "DB_NAME=$DB_NAME" >> .env
echo "NODE_ENV=$NODE_ENV" >> .env

npx medusa db:create --no-interactive
npx medusa db:migrate

echo "🚀 Starting Medusa server..."
exec npx medusa develop --host=0.0.0.0
