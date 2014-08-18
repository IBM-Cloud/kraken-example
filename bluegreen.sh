#!/bin/bash

cf push kraken-example-blue

# wait for the blue app to start
while true; do
    RESP=`curl -sIL -w "%{http_code}" "kraken-example-blue.mybluemix.net" -o /dev/null`
    if [[ $RESP == "200" ]]
    then
        break
    else
        sleep 3 && echo "Waiting for 200 response"
    fi
done

# make the blue app available to the router
cf map-route kraken-example-blue mybluemix.net -n kraken-example
cf map-route kraken-example-blue ibmserviceengage.com -n kraken-example

# unmap old routes
cf unmap-route kraken-example mybluemix.net -n kraken-example
cf unmap-route kraken-example ibmserviceengage.com -n kraken-example

#delete old app
cf delete kraken-example -f

cf rename kraken-example-blue kraken-example
cf delete-route mybluemix.net -n kraken-example-blue -f
