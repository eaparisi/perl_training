#!/bin/bash

actualPath="$PWD"
phase1="/phase_1"
pathToPhase1=$actualPath$phase1

cgidebug="/cgi-debug"
pathToCgiDebug=$actualPath$cgidebug

localGenYml="/docker/local_platform_gen.yml"
pathTolocalGenYml=$actualPath$localGenYml

localTempYml="/docker/local_platform_temp.yml"
pathToTemplocalYml=$actualPath$localTempYml

cp $pathTolocalGenYml $pathToTemplocalYml

sed -i "s|local_Path_to_Phase1|$pathToPhase1|g" $pathToTemplocalYml
sed -i "s|local_Path_to_Debug1|$pathToCgiDebug|g" $pathToTemplocalYml

cd docker
docker-compose -f local_platform_temp.yml stop
docker-compose -f local_platform_temp.yml rm
docker-compose -f local_platform_temp.yml up -d

echo "Done!"

