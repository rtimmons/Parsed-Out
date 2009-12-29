#!/bin/bash

# 
# This file runs all of the "unit" tests inside the test directory.
#


# For each dir entry:
for I in tests/*; do
    
    # Check if it's a directory:
    if [ ! -d "$I" ]; then
        # it's not a test directory (e.g. it's the README)
        continue
    fi
    
    pushd "$I" > /dev/null 2>&1
    
    # Check for the test
    if [ ! -x "test.sh" ]; then
        echo "No executable test.sh file inside $I.  Will now exit."
        exit 1
    fi
    
    # Run the test
    ./test.sh
    
    exit_status=$?
    # Check the return code:
    if [ "$exit_status" -ne 0 ]; then
        echo "Test $I failed with exit code $exit_status.  Will not continue."
        exit "$exit_status"
    fi
    
    popd > /dev/null 2>&1
    
done

