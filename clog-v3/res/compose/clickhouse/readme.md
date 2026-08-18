

generate:
APP_PASSWORD='replace-with-a-long-random-password'
printf '%s' "$APP_PASSWORD" | sha256sum


## Initialize
