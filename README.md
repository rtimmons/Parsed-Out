Parsed-Out
==========

Setting Up And Building
-----------------------

(After getting this up and running I do indeed feel parsed-out.)

I'm not an expert in any of these new-fangled technologies. But let's give this a go.

To get this site up and going:

1.  Make sure `blahtex` is on your PATH.

        which blahtex && echo "yep"

    Compiling `blahtex` is nontrivial! (At least it was when last I tried it.) I don't remember how I did it actually.  I just have a copy of `blahtex` that I compiled a long time ago and I've kept on Dropbox ever since, and I really hope it continues to work through OS X upgrades and across new machines.

2.  Install MacTeX (the big package). <http://tug.org/mactex/>  This beast takes up > 4 gigs of HD space.

3.  Install `rbenv` & rubies & bundler:

        brew install rbenv
        brew install ruby-build
        # restart shell!
        rbenv install $(cat .ruby-version)
        # restart shell!
        gem install bundler

4.  Bundle and install

        bundle install

5.  Install npm and build:

        brew install npm
        # restart shell!
        npm install -g bower
        npm install -g grunt-cli
        bower install
        grunt

### Troubleshooting

-   For issues in running latex, try `rm -r images/latex`.  The `blahtex` output is "cached" even if it's incorrect.

-   Restarting the shell is the new "restarting windows."

Using Pow
---------

Something like this to install *and* use pow:

    curl get.pow.cx | sh
    mkdir -p ~/.pow/parsedout
    ln -s $PWD/_site ~/.pow/parsedout/public

Now access the site locally: <http://parsedout.dev>.

This is a modern age in which we live, n'est-ce pas?

TODO
----

- Fix LaTeX output: the images are generated it seems but in the wrong place?
- Fix grunt script/css processing
- Reorganize posts and then preprocess before jekyll build.  I don't like that all posts are glommed together into one directory and then the date is embedded in the filename.  That's icky.

