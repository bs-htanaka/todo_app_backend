#!/bin/bash

if [ "${RAILS_ENV}" = "production" ]
then
  bundle exec rails assets:precompile
fi

set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /todo_backend/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
