#!/bin/bash

# hit-base-tool app
if [[ $(sudo docker ps -aqf "name=hit-base-tool") ]]; then
    sudo docker rm -f $(sudo docker ps -aqf "name=hit-base-tool")
fi
if [[ $(sudo docker images hit-base-tool -aq) ]]; then
   sudo docker rmi -f $(sudo docker images hit-base-tool -aq)
fi


# hit-base-tool db
if [[ $(sudo docker ps -aqf "name=hit-base-tool-db") ]]; then
    sudo docker rm -f $(sudo docker ps -aqf "name=hit-base-tool-db")
fi

if [[ $(sudo docker images hit-base-tool-db -aq) ]]; then
   sudo docker rmi -f $(sudo docker images hit-base-tool-db -aq)
fi

if [[ $(sudo docker ps -aqf "name=import-accounts") ]]; then
    sudo docker rm -f $(sudo docker ps -aqf "name=import-accounts")
fi

if [[ $(sudo docker images import-accounts -aq) ]]; then
   sudo docker rmi -f $(sudo docker images import-accounts -aq)
fi


# hit-base-tool-proxy
if [[ $(sudo docker ps -aqf "name=hit-base-tool-proxy") ]]; then
    sudo docker rm -f $(sudo docker ps -aqf "name=hit-base-tool-proxy")
fi
if [[ $(sudo docker images hit-base-tool-proxy -aq) ]]; then
   sudo docker rmi -f $(sudo docker images hit-base-tool-proxy -aq)
fi




