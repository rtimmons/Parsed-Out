---
layout: post
title: Goodbye, Wordpress
category: meta
---

I did it. I switched over from [Wordpress](http://wordpress.org) to a
completely *static* site: there is no more PHP (or Ruby or Python or anything
other than static files) here.

I got super fed up with Wordpress the other day when I realized that the
[Markdown][] plugin I had been using was completely screwing with my
line-endings (essentially running `nl2br()` on my posts). Rude. I could have
messed with the source myself, but I got really nauseous doing that with my
own custom theme hacks I did a while back. Combine that with the litany of
Wordpress attacks out there and my general disdain for the WP codebase (and
that I never supported nor plan on supporting comments), I figured this was
inevitable.

I worked for a while on my own static site generator, but then I stumbled
across [Jekyll](http://github.com/mojombo/jekyll/tree/master) and was
immediately impressed. It has support for Markdown, syntax highlighting
(although its syntax highlighter and its Markdown engine are awkward
together), *and* LaTeX:

\[
    \int_{-\infty}^{\infty}{ e^{-x^2} dx } = \frac{\sqrt\pi}{2}
\]

(Where $e:=\lim_{n\rightarrow\infty}\left(1+\frac{1}{n}\right)^n$. Inline
math is cool.)

Of course Jekyll didn't do everything I needed it to out of the box, so I
[forked](http://github.com/rtimmons/jekyll/tree/master) it (and renamed its
binary "rjekyll" because I'm creative). The main difference between the
original and my fork is proper pagination and a few tweaks to the Pygments
highlighting delegation.

Getting it all set up and running was a bit of a hassle and probably deserves
its own post, but it actually wouldn't be too hard for anyone to do given
enough time.

The entire source for this site is available on [my github repository][gh] for
ParsedOut.com.


[Markdown]: http://daringfireball.net/projects/markdown/
[gh]: http://github.com/rtimmons/Parsed-Out/tree/master
