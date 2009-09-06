---
layout: post
title: Multiple window.onload functions in JavaScript
category: coding
---

Writing in JavaScript often requires triggering code to execute *after* the
page has finished loading (that is, when the Document Object Model *DOM* is
ready).

Say you want to set the contents of the document's `<title>` tag to the
contents of the first `<h1>` tag. Here is the na"ive solution:

{% highlight html %}
<html><head><title></title>
  <script type="text/javascript" charset="utf-8">
  
    document.title =
        document.getElementsByTagName('h1')[0].innerHTML;
  
  </script>
</head><body><h1>Hello!</h1></body></html>
{% endhighlight %}

The problem, of course, is that this is executed while still in the `<head>`
section: before the `<body>` has even been seen. Thus, when we ask for
`document.getElementsByTagName('h1')`, we will get `null` back, and this will
cause an error.

The solution is to wait until after the document has loaded:

{% highlight html %}
<html><head><title></title>
  <script type="text/javascript" charset="utf-8">
  
    window.onload = function() {
        document.title =
            document.getElementsByTagName('h1')[0].innerHTML;
    };
    
  </script>
</head><body><h1>Hello!</h1></body></html>
{% endhighlight %}

This sets up a "callback" that the browser knows to execute as soon as it's
loaded the whole Document.

The problem, though, is that we might want *many* such functions to execute.
Lots of (or at least more than one) `window.onload`. And if we overwrite the
contents of `document.onload` as we've done here, then we've shot the rest of
our code in the foot and thrown it out to the curb to die.

The solution is to create a **stack** of functions to execute and simply add
them one by one. Then set `window.onload` to pop off all the functions on the
stack and execute them using the `call()` method for functions.

[jQuery][1] does this automatically. So we could simply have this in the
`<head>` section:

{% highlight html %}
<script type="text/javascript" charset="utf-8">

    $(function(){
        document.title = $("h1:first").html();
    });

</script>
{% endhighlight %}

...but if we didn't have jQuery at our disposal, we could do this manually:

{% highlight html %}
<html><head><title></title>
  <script type="text/javascript" charset="utf-8">
    
    // Prevent overwriting loadstack if it's already set:
    var loadstack = loadstack || [];
    
    // Add our function that changes the <title>
    // to the contents of the first <h1>:
    loadstack.push(function(){
        document.title =
            document.getElementsByTagName('h1')[0].innerHTML;
    });
    
    // ... lots of other additions to the loadstack ...

    // this *must* be the last code in the <head>
    // section's JS block (or at least the very last
    // thing to touch window.onload):
    
    if ( window.onload )
        loadstack.push(window.onload);
    
    window.onload = function()
    {
        while ( loadstack.length > 0 )
            // `this` will be bound to the window object
            // inside the called function
            loadstack.pop().call(this);
    };
  </script>
</head><body><h1>Hello!</h1></body></html>
{% endhighlight %}

Adding code to execute is simple as this:

{% highlight javascript %}
loadstack.push(function(win){
    // code to execute here.
    // (win is the window object if you need it)
});
{% endhighlight %}

All said, I usually just use jQuery's built-in handling of this, but it's nice
to know that it's pretty easy to to it all ourselves if we had to.

 [1]: http://jquery.com

