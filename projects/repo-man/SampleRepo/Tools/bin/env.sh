#!/bin/bash

# You should call source() on this file from within your ~/.bashrc

if [[ -z "$REPOMANTOOLSDIR" || ! -d "$REPOMANTOOLSDIR" ]; then
    echo "REPOMANTOOLSDIR is unset or not a dir, will now exit."
    return
fi

export PATH="$REPOMANTOOLSDIR/bin:$PATH"
export MANPATH="$REPOMANTOOLSDIR/man:$PATH"



