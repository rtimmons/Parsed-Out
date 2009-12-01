#!/bin/bash

# Generates HTML version of the wiki.
# TODO: finish

usage() {
	# Gives usage information.
	
	echo "Usage:"
	echo ""
	echo "    wiki2html.sh WIKI_SOURCE_DIR HTML_DEST_DIR"
	echo ""
	echo "WIKI_SOURCE_DIR is the directory with the wiki .txt Markdown files."
	echo "If omitted or of zero length will use the default 'Wiki' directory"
	echo "within the project root as determined by the findroot.sh script."
	echo ""
	echo "HTML_DEST_DIR is the output directory.  If omitted or zero length will"
	echo "use the default 'Target/Wiki' directory within the project root as"
	echo "determined by the findroot.sh script."
	echo ""
}


dir_resolve() {
	# Resolves all symlinks in first arg
	
	pushd $1 1>/dev/null 2>&1
	[ $? != 0 ] && return $?
	
	local out="$(pwd -P)"
	echo "$out"
	
	popd 1>/dev/null 2>&1
}


findroot() {
	local dirname=$(dir_resolve `pwd -P`)
	if [[ ! -d "$dirname/"]]
}


parse_args() {
	# Returns an array with two entries, WIKI_SOURCE_DIR and HTML_DEST_DIR.
	# If can't parse args properly will call usage() and exit with non-zero
	# status.
	
	local ARGS="$@"
	local root=""
	
	if [ -z "${ARGS[1]}" ]; then
		# find the root if not found already:
		[ -z "$root" ] && root=`findroot`
		ARGS[1]="$root/Target/Wiki"
	fi
	# TODO: finish
	echo ${ARGS[*]}
}


main() {
	# TODO: finish
	ROOT=?
	rm -r $ROOT/Target/Wiki
    cd $ROOT/Wiki
    for I in *.txt; do
        basename="$(basename -s .txt "$I")"
        Markdown.pl "$I" > "../Target/Wiki/$basename.html"
    done
    cp -r Media ../Target/Wiki/Media
}

parse_args "$@"
