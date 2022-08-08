#!/bin/sh

sed -i "/port/c\  \"port\":${MTPROTO_PORT}," config.json
sed -i "/secret/c\  \"secret\":\"${MTPROTO_SECRET}\"" config.json

exec "$@"
