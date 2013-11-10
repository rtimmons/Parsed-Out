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
    
    mkdir -p "$tempdir/root/foo/bar/baz/"
    if [ $? -ne 0 ]; then
        echo "Cannot create dir '$tempdir'"
        status=1
        exit 1
    fi
    
    touch "$tempdir/root/.repo-man"
    
    # find actual path of $tempdir since it may be symlinked
    pushd "$tempdir" 1>/dev/null
    tempdir=$(pwd -P)
    popd 1>/dev/null
}


myfindroot() {
    # wraper around findroot.sh script
    
    local rootsh="$thisdir/../../../bin/findroot.sh"
    if [ ! -x "$rootsh" ]; then
        echo "Not running $0 from proper dir or findroot.sh '$rootsh' is not in Tools/bin"
        status=2
        exit 2
    fi
    out=$("$rootsh" "$@")
    echo "$out"
}


testdir() {
    # Test that $1 reports correct root $2
    local innerdir="$1"
    local expected="$2"
    
    pushd "$innerdir" 1>/dev/null
    local root=$(myfindroot)
    if [ "$root" != "$expected" ]; then
        echo "Root for '$innerdir' expected '$expected' but got '$root'"
        status=2
        exit 2
    fi
    popd 1>/dev/null
}


thetest() {
    # tempdir by itself isn't in the mock project, so it shouldn't have a root
    testdir "$tempdir"                  ""
    testdir "/usr"                      ""
    
    testdir "$tempdir/root"             "$tempdir/root"
    testdir "$tempdir/root/foo"         "$tempdir/root"
    testdir "$tempdir/root/foo/bar"     "$tempdir/root"
    testdir "$tempdir/root/foo/bar/baz" "$tempdir/root"
}


###############################


main() {
    echo -n "Running findroot tests: "
    setup
    thetest
    cleanup
    echo "Success"
}


main "$@"

