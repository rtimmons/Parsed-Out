---
layout: post
title: Get and Set
---

Although I work with Java on a regular basis at work, I've long been scared
away from Java for personal projects based solely on its verbosity.

Rather than having object members ("properties") be declared public, Java
tends to have everything declared private and then accessed for
reading/writing via "getters" and "setters." So if a Document object has a
`title` property, the Document class would likely have the methods `String
getTitle()` and `void setTitle(String t)`.

What is simpler, however, is to overload a method having the same name as the
property. When called with *no* arguments, the method serves as the *getter*,
and when called *with* a single argument, the method serves as a *setter* -
setting the value to the indicated argument.

This is less verbose and more in-line with what happen "nowadays" with the more scripting-inclined languages like Ruby and PHP.

The old way:

    Document d = new Document();
    String oldTitle = d.getTitle();
    d.setTitle("New Title");

The new way:

    Document d = new Document();
    String oldTitle = d.title();
    d.title("New Title");

And here is a sample POJO *"Plain Old Java Object"* that utilizes this:

    class MyDocument
    {
    
        private String title;
    
        public MyDocument()
        {
        }
    
        public String title()
        {
            return title;
        }
    
        public void title(String t)
        {
            this.title = t;
        }
    
    }

Just my $0.02.