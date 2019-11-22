#!/bin/bash

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "unionpos/node container docker-entrypoint.sh"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

DIR=/docker-entrypoint.d

# is scripts exist in DIR run them
if [[ -d "$DIR" ]]
then
  /bin/run-parts --verbose "$DIR"
fi

echo "$@"
exec "$@"
