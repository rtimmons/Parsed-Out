#!/bin/bash

# Finds the project root of a repo-man project.  Can be run from within any
# repo-man project.

dir_resolve() {
	# Resolves all symlinks in first arg
	
	pushd $1 1>/dev/null 2>&1
	[ $? != 0 ] && return $?
	
	local out="$(pwd -P)"
	echo "$out"
	
	popd 1>/dev/null 2>&1
}



findroot() {
	echo $(dir_resolve "$(dirname $0)/../../")
}



main() {
	findroot
}



main

