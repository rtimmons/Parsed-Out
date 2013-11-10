---
layout: post
title: Google Interview Part 1
published: true
categories: coding
---

So I had my first Google interview last week.  I submitted an online resume and cover letter and was asked to come in for a 1.5-hour, 2-session interview on campus.  (No, I'm no longer a student.  I guess that doesn't matter.)  I got asked in about a month after submitting a resume.

Here's a brief summary on how each of the interview sessions went.  It's a bit sloppy, but you can deal with that.


### The First

Friendly software test guy.  Not super chatty but nice.
 
Question:

> Design an algorithm to visit every room in a building once.

This was really open-ended:  there were no constraints on what the structure of the input might be.  "You decide" was the response for most questions I asked about clarifications.

Since I knew I was going to have to code this up, I decided on using an adjacency matrix to represent the graph of rooms.  This also turned out to be wise because your solution can be optimized very easily. 

The answer is pretty easy.  I'll let you write the code, but here's a pretty detailed description of the algorithm and data structure used:

    Ryan's Room Algorithm
    -----------------------
    Let A be the square adjacency matrix of size n by n with
      A_i,j = A_j,i = 1 if room i is connected to room j and
      0 otherwise.  Represent this as n arrays of n boolean
      values:  boolean A[n][n]; If you have rooms A, B, C, D
      with a door between A->B->C->D, your matrix would look
      like this:
            [[ 1 1 0 0 ]
             [ 1 1 1 0 ]
             [ 0 1 1 1 ]
             [ 0 0 1 1 ]]
    Let V be an empty collection of rooms (can use size-n
      array or a hash table or ....).
    Function Do(Room R):
        For each entry E in A[R]
        if E is not in V, go from R to E and put E in V
        Perform Do(E)
        Go back from E to R
    You will end up back in R and will have visited every
      reachable room.

This is, of course, O(n^2) space, and it turns out to be O(n^2) time complexity as well.  You can do much better by using a simple Java class:

    class Room {
        int name;
        ... other data
        Collection<Room> children;
    }

You can use a `HashMap<Room,Boolean>` for your `V` in the above algorithm, and your solution ends up being O(n) worst-case in both time and space.  I was asked specifically about the optimizations that might be made if there were *lots* of other data about the rooms and if there were millions of rooms.   Specifically, you might want to leave the `Room` Java class pretty small and make it have a pointer to a `RoomData` object for the other data about the room.  Make this accessible via a method like `getRoomData()` or something so it can be made to do lazy initialization from the disk if necessary.  Note that `V` isn't really something you need to worry about.

Then I was asked how I would test my solution.  I drew some graph structures that might cause problems including an empty graph, a disconnected graph (sets of rooms that aren't connected to any other sets of rooms):

    +---+    +---+       +---+    +---+
    | A | -> | B |       | C | -> | D |
    +---+    +---+       +---+    +---+

and cycles (`A->B->C->A`).  The interviewer was very happy with my answers.

Important that you should think of other implementations:  this might have been implemented using a `Stack<Room>` or something of that sort, so giving a test case where that sort of thing might end in an infinite loop is wise.

### The Second

Really nice software engineer on the search team.

Question:

> Given a `List<List<T>>`, write an implementation for an `Iterator<T>`.

This is a "list of lists of items of type `T`", and you're asked to write an `Iterator` that returns the next `T`.  (I didn't remember everything the `Iterator` interface had, but the important bits are the `next()` and `hasNext()` methods.)

This is actually surprisingly easy if you use anonymous classes.  This is a good way to show off your question-asking ability, though like what the structure of the data might look like (are there allowed to be null values for the "inner" list:

    List<T> |  List<T> |  null | List<T> | List<T>

and what is the expected behavior of it, etc.  Say "as long as it's documented you can do whatever you want."  Developers love that kind of thing.  PMs and users hate it, but you're being jovial with a coder here, right?

Using an anonymous inner class was deemed to be a good solution by my interviewer who hadn't thought of doing something so clever.  I decided to declare that there could be no inner null lists.  Each element of the list of lists had to be a valid list of items.  This makes the coding a *lot* easier.

Here's a very basic outline of my solution:

{% highlight java %}
class ListOfList<T> implements Iterable<T> {
    
    private List<List<T>> data;
    
    public Iterator<T> iterator() {
        ListOfList<T> self = this;
        
        return new Iterator<T>() {
            Iterator<List<T>> outer = 
                self.data.iterator();
            Iterator<T> inner = outer.next();
            
            public boolean hasNext() {
                if ( ! outer.hasNext() ) {
                    outer = outer.next().iterator();
                    return hasNext();
                }
                return inner.hasNext();
            }
            
            public T next() {
                if ( !hasNext() )
                    return null;
                return inner.next();
            }
            
        };
    }   
}
{% endhighlight %}

I noted to the interviewer the "clever" use of recursion and how the assumptions work to my advantage.  Also note that the assumption isn't particularly reasonable (maybe) and that the code isn't so clear at first, so there should be lots of documentation.  Also note the slightly ugly usage of the `self` variable.  Note why this is necessary (because the `this` keyword is scoped to the inner class) and discuss closures.

I was then asked about how to test it and what the complexities are.  Testing is pretty easy; complexity is constant time (again using the assumptions).

I then asked the guy a bunch of questions about working for Google, and we chatted it up for about 20 minutes past when the interview was supposed to be finished.  This was mostly about some interesting projects at Google but was also about my past projects and interests as well.  It went long because the interviewer seemed to be legitimately enjoying the conversation.

In all, I think I'll get a callback!  The process was very "fair":  no "how would you move Mount Fuji" or weighing pills on balances questions; the questions were practical, open-ended and allowed me to show my stuff pretty well.


