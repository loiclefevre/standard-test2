#! /bin/bash

echo "Managing Oracle Autonomous Database..."
export INFO=$(curl -s -k -L -X GET "https://api.testpilotdev-controller.oraclecloud.com/ords/testpilot/admin/database?type=autonomous&hostname=`hostname`" -H 'accept: application/json')
export HOST=$(echo $INFO | jq -r '.database' | jq -r '.host')
export SERVICE=$(echo $INFO | jq -r '.database' | jq -r '.service')
goal="-DdbUser=test_$RUNID -DdbPassword=My_Password_4_Testing -DrunID=$RUNID -DdbHost=$HOST -DdbService=$SERVICE"
