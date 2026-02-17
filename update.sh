#!/bin/sh
domain="isthedowover50000.now"
server="https://grebedoc.dev"
user_agent="See GitHub dramforever/isthedowover50000.now"

set -evuo pipefail
curl --fail-with-body --user-agent "$user_agent" -H "X-Api-Key: ${API_NINJAS_TOKEN}" 'https://api.api-ninjas.com/v1/stockprice?ticker=%5EDJI' > data.json
cat data.json >&2
jq -r -f proc.jq < data.json > site/index.html
cat site/index.html >&2
tar cv -C site . | curl $server"" -X PUT -H "Host: $domain" -H "Authorization: Pages $GIT_PAGES_CLI_TOKEN" -H "Content-Type: application/x-tar" --data-binary @-
