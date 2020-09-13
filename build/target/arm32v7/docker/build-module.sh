#!/bin/bash

set -e

SCRIPT=`readlink -f $0`
SCRIPTPATH=`dirname "$SCRIPT"`
cd ${SCRIPTPATH}

TAG_ARRAY=`whoami`
REBUILD=0
PUBLISH=0
MODULENAME="flow-sensor"
PLATFORM="arm32v7"
REGISTRYURL="localhost:5000"
IONPROJECTPREFIX=""
BINARYNAME="flow_sensor.so"

DOCKERD_HOST=""

HBM_BASE_PATH=../../../../deps/hermes-base-cpp
HBM_RELEASE_FILE=${HBM_BASE_PATH}/hbm-release.json
HBM_RELEASE_SUPPORT_LIB=${HBM_BASE_PATH}/build/target/manage-release-info.sh

source $HBM_RELEASE_SUPPORT_LIB

HBM_BASE_OPTION=" --build-arg hbmBaseImage=$(get_base_image $HBM_RELEASE_FILE $PLATFORM)"


while getopts “t:cr:pb:h:” OPTION
do
     case $OPTION in
		 t)
			 TAGLIST=$OPTARG
			 IFS=', ' read -r -a TAG_ARRAY <<< "$TAGLIST"
			 ;;
		 c)
			 REBUILD=1
			 ;;
                 r)
                         REGISTRYURL=$OPTARG
			 ;;
                 p)      
                         PUBLISH=1
                         ;;

        b)
            HBM_BASE_OPTION=" --build-arg hbmBaseImage="$OPTARG
            ;;

        h)
            DOCKERD_HOST="tcp://${OPTARG}:2375"
            ;;
     esac
done

echo "$(tput setaf 2)Building module ${MODULENAME} ${PLATFORM}$(tput sgr0)"

rm lib/$BINARYNAME || :

pushd ../../../

./build-arm32v7.sh

BUILD_RC=$?
   
if test $BUILD_RC -ne 0; then
   echo "$(tput setaf 1)ERROR: Building binaries for module ${MODULENAME} ${PLATFORM} failed$(tput sgr0)"
   exit $BUILD_RC
fi

popd

echo "$(tput setaf 2)Building image: ${REGISTRYURL}/${PLATFORM}/${MODULENAME}:${TAG_ARRAY[@]}$(tput sgr0)"


REFERENCE_IMAGE_NAME="${REGISTRYURL}/${PLATFORM}/${MODULENAME}":`date +%Y%m%d_%H%M%S`

export DOCKER_HOST=$DOCKERD_HOST

docker build --rm --no-cache $HBM_BASE_OPTION -t $REFERENCE_IMAGE_NAME .
for TAG in "${TAG_ARRAY[@]}"
do
	docker tag $REFERENCE_IMAGE_NAME  ${REGISTRYURL}/${PLATFORM}/${MODULENAME}:${TAG}
done


BUILD_RC=$?
   
if test $BUILD_RC -ne 0; then
    echo "$(tput setaf 1)ERROR: Building image for module ${MODULENAME} ${PLATFORM} failed$(tput sgr0)"
    exit $BUILD_RC
fi

if test $PUBLISH -ne 0; then
    echo "$(tput setaf 2)Pushing image: ${REGISTRYURL}/${PLATFORM}/${MODULENAME}:${TAG_ARRAY[@]}$(tput sgr0)"

	for TAG in "${TAG_ARRAY[@]}"
	do
		docker push ${REGISTRYURL}/${PLATFORM}/${MODULENAME}:${TAG}
	done
    
    BUILD_RC=$?

    if test $BUILD_RC -ne 0; then
       echo "$(tput setaf 1)ERROR: Pushing image for module ${MODULENAME} ${PLATFORM} failed$(tput sgr0)"
       exit $BUILD_RC
    fi
fi

exit 0
