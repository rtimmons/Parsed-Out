The Tools directory is where the organization puts tools that pertain to
managing processes, builds, etc. for *all* projects (not the utilities for
managing any one project in particular).

Within Tools is Trunk, Testing, and Branches.  You should check out and work
with Testing unless you want to work on the files within Tools.

Inside one of the Tools branches you'll find the following directories:

 +  bin is for command-line utilities useful for working on projects.
    E.g., `wiki2html.sh` builds an HTML version of the project's `Wiki`
    directory and puts it inside the `Target` directory.

    This directory is placed on the $PATH using env.sh which should be
    source()d by your ~/.bashrc.

    One important utility is `findroot.sh` which looks up the directory tree
    for the project's root starting at the current working directory. This
    allows for you to be inside of any project and to run utilities on it
    easily without having to set variables or manage flags or whatever. (Note
    that `findroot.sh` finds the root by looking up the directory tree for a
    file called `.repo-man` as discussed in the below section.)

 +  lib is for build tools and support and things that don't directly
    translate to command-line utilities.

 +  man is for man pages for utilities within `bin`.  This directory
    is added to the MANPATH by env.sh.

 +  test contains tests for the tools.  They can be run by running
    run_tests.sh

