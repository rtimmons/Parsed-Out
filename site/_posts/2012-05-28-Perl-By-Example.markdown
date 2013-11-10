---
layout: post
title: Perl By Example
category: coding
published: false
---

TODO: cleanup and provide more background.

Printing Data Structures
------------------------

Can `use Data::Dumper;` to print complex data structures.  Example:

    #!/usr/bin/env perl -w

    use strict;
    use warnings;
    use Data::Dumper;
    
    my $us = [1,2,[3,4],{a=>1,b=>2}];
    print Dumper($us);
    
    $us = {a=>{b=>2},c=>[3,4,5,[6,7]]};
    print Dumper($us);


Prints the following:

    $VAR1 = [
              1,
              2,
              [
                3,
                4
              ],
              {
                'a' => 1,
                'b' => 2
              }
            ];
    $VAR1 = {
              'c' => [
                       3,
                       4,
                       5,
                       [
                         6,
                         7
                       ]
                     ],
              'a' => {
                       'b' => 2
                     }
            };

Array of words shorthand
------------------------

    my @as = qw/a b c d/;
    # same as this:
    my @as = ('a','b','c','d');

Quoting
-------

Single-quotes do not allow for variable interpolation. Double-quotes do. The
`q` operator generalizes single-quotes, and the `qq` operator generalizes
double-quotes. Any delimiter you want can be used after `q` and `qq` but
parens or curly-brackets are common.

Example:

    my $name = 'Ryan';
    print '$name';
    print "$name";
    
    $name = q(Foo);
    print q($name);
    print qq($name);
    
    $name = q{Bar};
    print q{$name};
    print qq{$name};
    
    $name = q=Baz=;
    print q/$name/;
    print qq%$name%;

Prints the following:

    $name
    Ryan
    $name
    Foo
    $name
    Bar
    $name
    Baz

In perl, quotes are operators just like plus signs and functions. That is,
they're not special to the lexer. So you can mix different types of quoting
easily:

    my $string = qq[This string "has 'quotes'"];
    print $string;

prints the following:

    This string "has 'quotes'"


Iterating over a hash
---------------------

    my %family = ( name=>'Flinstone', father=>'Fred', mother=>'Wilma' );
    for my $key (keys %family) {
        my $value = $family{$key};
        print "$key => $value\n";
    }


Iterating over a hash-ref
-------------------------

    my $family = { name=>'Flinstone', father=>'Fred', mother=>'Wilma' };
    for my $key (keys %$family) {
        my $value = $family->{$key};
        print "$key => $value\n";
    }


Iterating over an array
-----------------------

    my @users = (324234, 234892374, 3249872);
    for my $user (@users) {
        # ...
    }


Iterating over an array-ref
---------------------------

    my $users = [324234, 234892374, 3249872];
    for my $user (@$users) {
        # could also use @{$users} but that's ugly
    }


Iterating over multiple array-refs
----------------------------------

    my $good = [1,2,3,4];
    my $bad  = [5,6,7,8];
    for my $n (@$good, @$bad) {
        # ...
    }


Mapping Over an Array
---------------------

The `map` function is used to implicitly iterate over an array. It sets the
scalar variable `$_` to the current item.

Example:

    my @users = (1,2,3,4);
    map { print $_ } @users;
    # prints 1234

Equivalent to this:

    my @users = (1,2,3,4);
    for my $user (@users) {
        print $user;
    }

There is also an implicit `return` statement inside the `map` method, so you
can use it to transform an array:

    my @odds = (1,3,5,7);
    my @evens = map { $_ * 2 } @odds;

Try-Catch
---------

A call to `die()` is like `throw` in Java. If code is wrapped in an `eval`
block, any calls to `die()` are trapped and are then made available in the
special scalar variable `$@`.  If no code within the `eval` block `die()`s, 
the `$@` variable is falsy.

Example:

    eval {
        die("It's a cruel world!");
    };
    if ( $@ ) {
        print "$@\n";
    }
    # will print "It's a cruel world!"

Object-Oriented Perl
====================

Notes
-----

The `ref()` subroutine returns the "class" of a ref (or `undef` (null) if it's
not a ref) which is occasionally useful.

    my $scalar = 7;
    print ref($scalar); # prints nothing
    
    my $hashref = {a=>1};
    print ref($hashref); # prints "HASH"
    
    my $arrayref = [1,2,3];
    print ref($arrayref); # prints "ARRAY"
    
    my $user = User->new();
    print ref($user); # prints "User"

Method Calls
------------

When you call a method on a string, such as

    my $user = User->new(7)

Perl rewrites this to call

    new('User',7);

from the `User` package.

The first argument--the one that Perl adds in for you--is commonly called the
"invocant".

Similarly, when you call a method on a blessed reference, e.g.:

    $user->user_id()

Perl rewrites this to call

    user_id($user)

from the whatever package name the `$user` ref was blessed with.

Blessed References
------------------

`bless` just associates a String to a ref so Perl knows which package to look
in for methods.

Create a package called `Migration.pm`:

    package Migration;
    sub new {
        # the name of the package is implicitly added
        my ($package) = @_;
        my $self = { user_id => 7 };
        return bless $self, $package;
    }
    sub user_id {
        my ($self) = @_;
        return $self->{user_id};
    }
    1;

(The `1;` is at the end of the file so when you `require` the file from other
files the last statement seen is true so the `require` won't `die`. Without
the `1;` you wouldn't be able to include the file in other files.)

Now `use` the new package:

    #!/usr/bin/env perl -w
    use strict;
    use warnings;
    use Migration;
    
    my $migration_instance = Migration->new();
    # This implicitly calls
    #   my $migration_instance = new('Migration') 
    # from the Migration package.

    my $user_id = $migration_instance->user_id();
    # This implicitly calls
    #    my $user_id = user_id($migration_instance);
    # from the Migration package.

You can actually bless anything manually:

    my $user = bless {user_id=>7}, 'User';

but that's weird.

Advanced Blessed References
---------------------------

It's common to allow an object to be constructed using a hash and to simply
use a blessed reference to that hash as the object itself.

You will usually see objects created like this:

    my $user = User->new(
        user_id => 7,
        user_alias => 'Ryan'
    );

The constructor looks like this:

    package User;
    
    # Constructor
    sub new {
        my ($invocant, %options) = @_;
        my $class = ref($invocant) || $invocant;
        return bless \%options, $class;
        # I like to use the arrow `=>` instead of a comma for clarity:
        #   return bless \%options => $class
    }

The line

    my $class = ref($invocant) || $invocant;

allows you to construct a new instance using an existing instance *or* the
package itself.  So the following two lines are equivalent:

    my $user1 = User->new(7);
    my $user2 = $user1->new(7);

The first line will be rewritten to look like this:

    my $user1 = new('User',7);
    # invoked within the User package
    # $invocant will be 'User'.
    # ref('User') is undef, so $class will be just 'User'

The second line will be rewritten to look like this:

    my $user2 = new($user, 7);
    # invoked within the User package
    # invocant will be $user1 which is a reference blessed with the 'User' package
    # so ref($user1) will be 'User', and hence class will be 'User'


Perl DB
=======

Here's an idea for a Perl class ("package") that could make interacting
wit a Database very easy but doesn't require you to lose flexibility
like a traditional ORM does.

If the methods fail for whatever reason, the methods will call `die()`.

Database Wrapper Methods
------------------------

 +  `new(%options)`:  
    Constructor. Blesses a ref to the given hash. Does not actually establish a
    connection until necessary.
    
     Useful options:
    
     - `stage` : either 'alpha' or 'prod' to indicate which set of databases
       to connect to.
    
     - `read_only` : truthy or falsy value indicating whether `commit()`
       should rollback if not explicitly forced.

 +  `run_query($sid, $sql)`:  
    Simply executes the given `$sql`.

 +  `commit($sid,$force)`:  
    Commits all interactions on the given `$sid`.  If the object was created
    with `read_only=0`, this will actually issue a rollback, so to force the
    operation, you can set `$force` to `1` to force a commit even in read-only
    mode.  If no `$force` is given will assume `0`.
    
 +  `get_rows($sid,$sql,$values)`:  
    Runs the given `$sql` on the given `$sid`. The SQL may have `?`
    parameters, and `$values` is an array-ref of values to fill in for those
    parameters. Returns back the given rows as an array-ref of hash-refs.

    Example:
    
        my $seven_ready_rows = $db->get_rows('staging',
            "SELECT * 
             FROM   my_table 
             WHERE  process_status = ?
             AND    rownum <= ?", ['R', 7]);

    Would run the SQL:
    
        SELECT  *
        FROM    my_table
        WHERE   process_status = 'R'
        AND     rownum <= 7

    and would return an array-ref like the following:
    
        my $seven_ready_rows = [
            { USER_ID => 293847, PROCESS_STATUS => 'R' },
            { USER_ID => 234324, PROCESS_STATUS => 'R' }
        ];

 +  `get_unique_row($sid,$sql,$values)`:  
    Just like `get_rows()` but will `die()` if there are more than one rows
    returned.  Returns a hashref representing the row.

 +  `get_table_rows($sid,$table,$such_that)`:  

    Returns all the rows from the indicated `$table` on the given `$sid`
    matching the given `$such_that` conditions. `$such_that` is a hashref that
    maps columns to values that must exactly match in the given query. The
    `$such_that` conditions are automatically quoted. Additionally, there can
    be a `where` key that is added literally to the end of the `WHERE`
    predicates in the generated SQL. Returns the selected rows as an arrayref
    of hashrefs.
    
    Example:
    
        my $some_user = $db->get_table_rows(
            'users','my_table', {
                PROCESS_STATUS => 'R',
                USER_ID => 8947,
                where => 'rownum <= 7'
            }
        );
    
    Runs the following query and returns the selected rows:
    
        SELECT  *
        FROM    my_table
        WHERE   process_status = 'R'
        AND     user_id = 8947
        AND     rownum <= 7

    You can prevent quoting of the `$such_that` values by using a
    `LiteralSqlValue` class:
    
        my $null_procs = $db->get_table_rows(
            'staging', 'the_table', {
                PROC_GUID => LiteralSqlValue->new('process_status')
            }
        );
        
    This runs the following query:
    
        SELECT  *
        FROM    the_table
        WHERE   proc_guid = process_status
    
    Without the `LiteralSqlValue`, the query would look like this:
    
        SELECT  *
        FROM    the_table
        WHERE   proc_guid = 'process_status'

 +  `get_unique_table_row($sid,$table,$such_that)`:  
    Just like `get_table_rows()` but will `die()` if more than one row is 
    found.  Returns a hashref representing the selected row.

 +  `insert($sid,$table,$row)`:  
    Inserts the given `$row` hashref into the indicated `$table` on the given
    `$sid`.
    
    Example:
    
        $db->insert('staging','the_users', {
            USER_ID => 839247,
            USER_ALIAS => 'ryan'
        });
    
    Runs the following SQL:
    
        INSERT INTO the_users (USER_ID, USER_ALIAS) 
        VALUES (839247, 'ryan');
    
    Again, can use `LiteralSqlValue` to prevent quoting of
    values (e.g. to use a sequence).

 +  `update($sid,$table,$update,$such_that)`:  
    Updates all the rows on the indicated `$table` matching the given
    `$such_that` hashref to have the values specified by the `$update`
    hashref. 
    
    Example:
    
        $db->update('staging','my_table'
            { PROCESS_STATUS => 'R' },
            { PROC_GUID => 'SDFKLSHFSDF' }
        );
    
    Runs the following SQL:
    
        UPDATE  my_table
        SET     PROCESS_STATUS = 'R'
        WHERE   PROC_GUID = 'SDFKLSHFSDF'
    
    Returns the number of rows updated.
    
 +  `update_unique_row($sid,$table,$update,$such_that)`:  
    Like `update()` but will `die()` if more than one row is updated.


Example Script
--------------

    #!/usr/bin/env perl -w

    use strict;
    use warnings;
    
    use Database;
    
    my $db = Database->new(
        stage     => 'alpha',
        read_only => 1,
    );

