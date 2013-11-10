Welcome to the repository.

This is "learn by exploring." Check out the Readme.txt files where
appropriate.

More Info
=================

*Repo-man* is a project-management system that is designed to be entirely
contained within the source-code repository.

Other setups require using the repository for making code changes but stepping
into an external system for bug management, use cases, documentation, etc.,
etc. This commonly means that developers *don't* write good documentation,
don't refer to bugs often enough, and they completely ignore use cases. The
Agile Process [says it best][ap], "If you don't use your process it can't help
you; if your process doesn't help, you won't use it."

Repo-man steps in and provides "one true place" for managing *everything*
about a project. The idea is that no other tools or systems are needed: you
don't need a web browser, you don't need Microsoft Project, you don't need any
third-party ticketing system: the repository has everything in it organized
logically and versioned right along with the source code that it describes.
Since there is some benefit in being able to browse bugs and use a
cross-referenced wiki, there are scripts designed to provide HTML-based views
on the data.

Here are some key aspects:

 -  The conventions are designed around XP, Scrum, Agile, etc. and favor test-
    and use-case-driven development.

 -  All documentation is written in [Markdown][] for easy editing and
    conversion to HTML when appropriate. (Support for groff output with
    the [pandoc][] tool is coming.)

 -  There is no specific requirement on the kind of SCM used:  you can use
    Subversion, Git, Perforce, or even dreaded CVS.

 -  There is no requirement on the language or environment you are coding in.
    The provided scripts are written in bash, but they are easy to adapt if
    necessary.


Quick Start
================

 1. Create a place to put your work space.  It can be anywhere.
 
        mkdir $HOME/depot

 2. Check out the Trunk of the Tools directory:

        cd $HOME/depot
        svn checkout Repository/Tools/Trunk Tools

    (See below for the recommended checkout with Perforce.)

 3. Set this directory as your `$REPOMANTOOlSDIR` environment variable inside
    your shell profile:

        echo "export REPOMANTOOLSDIR='$HOME/depot/Tools'" >> ~/.bashrc

 4. Add a line to source() the `env.sh` script to your shell profile:

        echo "source $REPOMANTOOLSDIR/bin/env.sh" >> ~/.bashrc

 5. Restart your shell.

 6. Check out a project. 


Recommended Checkout
========================

## Perforce ##

If you are using Perforce, the given layout should be checked out like this:

    //depot/Projects/MyProject/Sprints/...    //client/MyProject/Sprints/...
    //depot/Projects/MyProject/Wiki/...       //client/MyProject/Wiki/...
    //depot/Projects/MyProject/Vendor/...     //client/MyProject/Vendor/...
    //depot/Projects/MyProject/Code/Trunk/... //client/MyProject/Code/...
    //depot/Projects/MyProject/.repo-man      //client/MyProject/.repo-man
    //depot/Tools/Trunk/...                   //client/Tools/...

Branches can be made in personal space (`//depot/Users/$User`) or managed with
Git/mercurial/whatever on personal machines.

## SVN ##

Checking out with SVN looks like this:

    mkdir -p workspace/MyProject/Vendor; cd workspace
    svn co http://svn/Projects/MyProject/Sprints    MyProject/Sprints
    svn co http://svn/Projects/MyProject/Wiki       MyProject/Wiki
    svn co http://svn/Projects/MyProject/Code/Trunk MyProject/Code
    touch MyProject/.repo-man



[ap]: http://www.agile-process.org/process.html
[Markdown]: http://TODO [pandoc]: http://TODO
