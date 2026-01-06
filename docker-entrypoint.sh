#!/bin/sh
set -e

# Generate .htpasswd from environment variables
if [ -n "$AUTH_USERNAME" ] && [ -n "$AUTH_PASSWORD" ]; then
    htpasswd -bc /etc/nginx/auth/.htpasswd "$AUTH_USERNAME" "$AUTH_PASSWORD"
    echo "Basic auth configured for user: $AUTH_USERNAME"
else
    echo "ERROR: AUTH_USERNAME and AUTH_PASSWORD must be set"
    exit 1
fi

# Execute the main command
exec "$@"
