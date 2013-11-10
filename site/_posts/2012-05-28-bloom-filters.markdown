---
layout: post
title: Bloom Filters
published: false
categories: coding
---

The other day, we were confronted with an issue that required a clever use of bloom-filters, and I thought I'd give a quick run-down:

Let's say someone is searching for shirts and they want to sort based on price.  This seems easy, but think about how dynamic pricing is these days: coupons, sales, promotions ...

We have an internal search tool that sorts results based on really complicated metadata, but all that metadata is specific to individual items, not specific to the request.

So we can easily sort based on the MSRP ("list price"), but if you want to run a particular promotion that gives a 50% discount only to users who have purchased the same shirt in red, you couldn't do this without knowing the requester's order history.  It's impractical to put this kind of data into the search engine ahead of time.  (It's also unethical; we can't have order history floating everywhere!)

We also can't simply look it up at runtime and pass it in to the sorter since there's way too much data to pass in:  if I've been a customer for 20 years, I might have megabytes' worth of data, and even very fast machines with very fast network cards can't consume thousands of those kinds of requests every second.  Let's say we can't give the sorter more than 10 kilobytes of request-specific data.

So what can we do with only 10 kilobytes of data?  We can construct a bloom-filter that represents all the items we want the customer to receive at a particular price-point and pass that in.

Let me give my version of what a bloom filter is.  If you're not satisfied, you can look at [wikipedia's description][wiki].

A bloom filter is a data structure that's kind of like a super-compact (but kinda messy) hash-set.  You create an array of bits of some size -- let's say 10 -- and you start with all the bits to 0:

    0 0 0 0 0 0 0 0 0 0

Then every time you add a new item to the set, you compute its hash and set all the corresponding bits in the filter to 1.  So if you add an item whose hash is `1011000000`, your filter becomes:

    1 0 1 1 0 0 0 0 0 0

If you next add an item whose hash is `0100000011`, your filter becomes this:

    1 1 1 1 0 0 0 0 0 1

If your hashes and your bloom filters are of different sizes, you can choose to add `0`s to one end.

Now to tell whether or not an item exists in a bloom filter, you just compute its hash and see if all the 1s are in the bloom filter.  Hopefully it's clear that the bloom filter would indicate that both the items we've added are there.

And I also hope you're keen and see that bloom filters can give you *false positives*.  Since a bloom filter kind of "stacks" or "merges" all hash values on top of each other, you can't identify when a bit is set because it belongs to your item or another item entirely.  Say you have an item whose hash is `0111000000`. We would look at all the `1`s in the hash, and see if the same `1`s are set in the filter:

    Item:   0 1 1 1 0 0 0 0 0 0
    Filter: 1 1 1 1 0 0 0 0 0 1

Sure enough, all the `1`s in the item's hash are set in the filter, so our filter would report that the item is in the filter!

The chance of false-positives depends on how many items are in the filter and how big the filter is.  

[wiki]: http://en.wikipedia.org/wiki/Bloom_Filter

TODO: finish
