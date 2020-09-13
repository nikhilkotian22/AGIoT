#!/bin/bash

set -e

TEST_STR=""
UNITTEST=0
MODULE_NAME=$(jq .Name ../module.json |tr -d '"')

while getopts “uch” OPTION
do
     case $OPTION in
		u)
			TEST_STR="-Dtest=ON"
            UNITTEST=1
            ;;

     esac
done

rm CMakeCache.txt cmake_install.cmake install_manifest.txt Makefile || :
rm -rf CMakeFiles/ || :
rm -rf src/ || :

cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=Debug -DPLATFORM_NAME:STRING="x86_64" $TEST_STR ..

make -j `nproc`
make install 

if test $UNITTEST -ne 0; then

    UNIT_TEST_DIR=platform/artifacts/unit-tests/
    UNIT_TEST_RESULT=${UNIT_TEST_DIR}/${MODULE_NAME}.xml
    UNIT_TEST_COVERAGE=${UNIT_TEST_DIR}/coverage
    rm -rf ../$UNIT_TEST_DIR
    mkdir -p ../${UNIT_TEST_COVERAGE}
	echo ${UNIT_TEST_COVERAGE}
    export LD_LIBRARY_PATH=../../base/build/install/lib:$LD_LIBRARY_PATH
    ./tests/${MODULE_NAME}Test --gtest_output=xml:../${UNIT_TEST_RESULT}
   
   #Export report in Cobertura format and HTML report as well
   pushd ..
   gcovr --xml -o ${UNIT_TEST_COVERAGE}/tests-coverage.xml -e deps -s
   gcovr --html --html-details -o ${UNIT_TEST_COVERAGE}/index.html -e deps
   popd


fi
