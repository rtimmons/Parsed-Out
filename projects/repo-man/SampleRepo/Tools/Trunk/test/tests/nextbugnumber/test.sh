#!/bin/bash

tempdir="/tmp/repotest.$$"
thisdir="$PWD"
status=0

cleanup() {
    [ -d "$tempdir" ] && rm -r "$tempdir"
}

trap 'cleanup; [ $status -ne 0 ] && echo Fail' INT TERM EXIT


setup() {
    # Pre: $tempdir is set to a temporary dir
    # Post: test is ready to run
    
    mkdir "$tempdir"
    if [ $? -ne 0 ]; then
        echo "Cannot create dir '$tempdir'"
        status=1
        exit 1
    fi
    
    mkdir -p "$tempdir/root"
    if [ $? -ne 0 ]; then
        echo "Cannot create dir within '$tempdir'"
        status=1
        exit 1
    fi
    
    touch "$tempdir/root/.repo-man"
    
    # find actual path of $tempdir since it may be symlinked
    pushd "$tempdir" 1>/dev/null
    tempdir=$(pwd -P)
    popd 1>/dev/null

    # make a fake bug outside the root
    mkdir -p "$tempdir/Bugs"
    touch "$tempdir/Bugs/001.txt"
    
    # Make the mock bugs dirs:
    local ROOT="$tempdir/root"
    mkdir -p "$ROOT/Sprints/"{Current,Future,Next,Past}/Bugs
}


mynextbugnumber() {
    # wrapper around the nextbugnumber script
    
}

thetest() {
    local ROOT="$tempdir/root"
    touch "$ROOT"
}


###############################


main() {
    echo -n "Running nextbugnumber tests: "
    setup
    thetest
    cleanup
    echo "Success"
}


main "$@"

