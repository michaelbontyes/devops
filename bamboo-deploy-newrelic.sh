#!/bin/bash

APP='app_ID'
API_KEY='api_key'

URL='https://api.newrelic.com/v2/applications/'${APP}'/deployments.json'
DATA='{"deployment": { "revision": "'${bamboo.planKey}'-'${bamboo.buildNumber}'", "description": "'${bamboo.buildResultsUrl}'", "user": "'${bamboo.ManualBuildTriggerReason.userName}'"}}'
echo 'https://api.newrelic.com/v2/applications/'${APP}
curl -X POST ${URL} -H 'X-Api-Key:${API_KEY}' -i -H 'Content-Type: application/json' -d "${DATA}" > deployments.log
