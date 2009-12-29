#!/bin/bash

# Finds the project root of a repo-man project.  Can be run from within any
# repo-man project.

# Assumptions:
# 
#  + a directory is a repo-man root if and only if it has a file named
#    .repo-man in it.
#    
#  + this script is being run from within a repo-man root or a descendant
#	 of a repo-man root.


dir_resolve() {
	# Resolves all symlinks and relative paths in first arg
	
	pushd $1 1>/dev/null 2>&1
	[ $? != 0 ] && return $?
	
	local out="$(pwd -P)"
	echo "$out"
	
	popd 1>/dev/null 2>&1
}



findroot() {
	local dir=$(dir_resolve $1)
	if [ -f "$dir/.repo-man" ]; then
		echo "$dir"
	elif [ "$dir" = "/" ]; then
		exit 1
	else
		dir=$(dirname "$dir")
		findroot "$dir"
	fi
}



main() {
	findroot
}



main

