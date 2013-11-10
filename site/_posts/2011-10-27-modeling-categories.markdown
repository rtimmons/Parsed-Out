---
layout: post
title: Modeling Books, Categories, and Subcategories
categories: Data Modeling, coding
published: false
---

Today I want to explore how to "properly" represent a category and subcategory structure that we theoretically use at [Audible](http://www.audible.com/).  I'm interested in doing this in Java, but I'll pay homage to how it might be done in Ruby as well.

The setup is simple: you have books and categories.  Here are the rules of the game:

1. A book can belong to zero or more categories,
2. A category may have zero or more child categories,
3. When a category has children, those children are called "subcategories", and
4. When a category is not the child of any other categories, we call it a "top-level category".

Let's assume these are the full set of requirements so far, and we can build things in as they are needed.

The easiest thing to model is the Book class:


{% highlight java %}
class Book { }
{% endhighlight %}

I'll have some discussion about possibly including category information in the book itself later.

What's more complicated is the `Category` class.  Let's first note that a Category has a number (0 or more) books inside of it.  I.e., some `Collection` of books.  I would argue that a `List` is incorrect since (1) the order doesn't matter and (2) a book shouldn't be able to belong to a category twice.  These are natural consequences of point 1.  So then the association from categories to books is easy:

{% highlight java %}
class Category {
    Set<Book> books;
}
{% endhighlight %}

But now how do we represent subcategories?

This is where I've seen many people get stumped.  The bullet points 3 and 4 above are red-herrings.  There is *no need* to have a separate `Subcategory` class.  Instead, recognize that a subcategory is itself a category and that the category data structure is recursive.

With that in mind, there are two options: include a reference to children or include a reference to the parent.

    class Category {
        Category parent;
    }
    
    class Category {
        Set<Category> subcats;
    }

TODO: finish


