#!/bin/bash

# wait for the blue app to start
while true; do
    RESP=`curl -sIL -w "%{http_code}" "kraken-example.mybluemix.net" -o /dev/null`
    if [[ $RESP == "200" ]]
    then
        echo "Waiting for a bad response, we shouldnt get one..."
    else
        echo "Response was ${RESP}, this is bad"
        break
    fi
done
