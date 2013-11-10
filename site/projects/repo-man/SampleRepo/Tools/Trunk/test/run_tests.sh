#!/bin/bash


# This file runs all of the "unit" tests inside the test directory. Each
# directory inside of 'tests' should have an executable 'test.sh' script that
# should exit exit 0 on success or not 0 on failure.


if [ ! -d tests ]; then
    echo "Should be run from with Tools/test"
    exit 1
fi

# For each dir entry:
for I in tests/*; do
    
    # Check if it's a directory:
    if [ ! -d "$I" ]; then
        # it's not a test directory (e.g. it's the Readme.txt),
        # so go to the next 'tests' directory entry.
        continue
    fi
    
    pushd "$I" > /dev/null 2>&1
    
    # Check for the test
    if [ ! -x "test.sh" ]; then
        echo "No executable test.sh file inside $I."
        popd >/dev/null 2>&1
        continue
    fi
    
    # Run the test and grab the exit code
    ./test.sh
    exit_status=$?
    
    # Check the return code:
    if [ "$exit_status" -ne 0 ]; then
        echo "Test $I failed with exit code '$exit_status'.  Will not continue."
        exit "$exit_status"
    fi
    
    popd > /dev/null 2>&1
    
done

