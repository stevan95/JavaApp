#!/bin/bash

#Copy new jar to biild location
cp -f java-app/target/*.jar jenkins/build/

echo "*******************************"
echo "***** Building Docker Image ***"
echo "*******************************"

cd jenkins/build/ && docker-compose -f docker-compose-build.yaml build --no-cache
