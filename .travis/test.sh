#!/usr/bin/env bash

TEST_COMMAND="exec ctest --output-on-failure"
if [ $COVERALLS = "ON" ]
then
    TEST_COMMAND="exec make coveralls"
fi

echo "Test"
echo "TEST_COMMAND=$TEST_COMMAND"
docker exec cpp_tango /bin/sh -c "cd /home/tango/src/build; $TEST_COMMAND"
if [ $? -ne "0" ]
then
    exit -1
fi
