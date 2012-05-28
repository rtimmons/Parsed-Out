---
layout: post
title: OmniFocus Guide
category: writing
published: false
---

I've been a GTD fan for a while and have used OmniFocus for a little over a year. I've had to completely start over from scratch with my OF library at least three times because I was either over-engineering things or I hadn't made clear rules about what went where.

I also like to tinker with things like Evernote, TiddlyWiki, Dropbox, and other things that go into others' GTD systems. Ultimately, I decided that OmniFocus is "the one true system" and that I wouldn't have any actions that lied elsewhere, but that I would allow other tools to serve as "project resources." I use other tools in addition to OmniFocus for information management, but I had to add sharp edges to keep things clear.

Let me describe my current setup. I'll start by describing the basic structure I have set up in OmniFocus (the "theory") and will then describe how I use this structure to actually do things (the "practice").

# The Theory

## Projects

I define a project how David Allen does:

> any outcome you're committed to complete that requires more than one action step

My biggest hurdle with OmniFocus and GTD in general was defining projects and deciding when something was really "done". The *Getting Things Done* book defines the "Natural Project Planning Model," and the most useful bit to this for me was "Purpose & Guiding Principles":

1.  Why is this being done?
2.  What would "On Purpose" really mean?
3.  What are the key standards to hold in making decisions and acting on this project? What rules do we play by?
4.  The purpose and principles are the guiding criteria for making decisions on the project

Items (4) and (2) are necessary for all projects. As such, all projects--even remarkably simple ones--are labeled with "visible outcomes". I would *not* have "Kitty" as a project, but I might have "Take Kitty to Vet" or "Get Kitty a New Bed." But some projects are big, complicated beasts and aren't quite as simple as "Setup TiVo." Indeed, some projects require hours of *planning* let alone visible action. These are the ones that require the clarity of (3) and (4).

For complicated projects, I use the notes feature in OmniFocus, and I always start with this bit of text (using Typinator to fill it in for me...)

    # Successful Outcome Criteria # 
    1.

Whenever I'm having difficulty deciding next actions and what the scope of a project is, I come back to these successful outcome criteria in the project notes for clarity.

Later in *Areas of Focus* I'll describe how I group projects together to gain additional, larger-scale clarity.

## Contexts

I group my contexts primarily by function and then by physical location. This is primarily because much of what I do on a daily basis centers around one or two physical locations: home and the office.

Here's my Context hierarchy:

    Contexts
    ├── Errands
    │   ├── Department Store
    │   ├── Drug Store
    │   └── Grocery Store
    ├── Home
    │   ├── Chores
    │   └── Morning
    ├── Office
    │   └── Scrum
    ├── OmniFocus
    │   ├── Clarify
    │   ├── Delegated
    │   ├── Static
    │   └── Waiting
    ├── People
    │   ├── Boss
    │   ├── Colleague X
    │   ├── Colleague Y
    │   ├── Dad
    │   ├── Doctor
    │   └── Mom
    ├── Phone
    │   └── Business Hours
    └── Workplace
        ├── Kill Time
        ├── WS Home
        └── Work

Some of these should be pretty obvious, but let me explain a few things:

- **Workplace** is for actions that can be done either at home or at the office. I.e., anywhere I have my computer and project-support materials. But there are some sub-contexts that make

    - **Workplace/Kill Time** is for actions that are very low priority and require very little mental effort. Things like random articles to read and products to look at get put in this perspective.

    - **Workplace/WS Home** is for actions that I need to do at my desk at home. This is distinct from my *Home* Context for reasons that I will explain in the *Perspectives* section.

        (I prepend "WS" to the name so it appears distinct from my *Home* context since OF doesn't show the full Context hierarchy in Planning Mode.)

    - **Workplace/Work** is for actions that can only be done at the office.


- **Home** is for actions that can *only* be done while at home. E.g., there's a specific, at-home resource the action needs.

- **Home/Chores** is for, well, chores. Usually this is cleaning, etc. Having a separate context for chores helps me mentally prioritize things as I look at the Home context.

    I will discuss chores and repeating actions in general in the *Case Studies & Workflows* section.


I don't find that it works for me to stick to *only* next actions in OmniFocus. Sometimes an idea occurs to me for a project, and I don't really feel like deciding a next outcome. For this I have a special context that I call *Clarify*. This is an "On Hold" context meaning that it doesn't show up as actionable. Part of my weekly review is to get rid of all *Clarify* actions either by deleting them, redefining them, or marking them as Waiting.

## Areas of Focus

The key to using folders is to think about what you want to "focus" on. The only effective use of OF's "Focus" command is to use it on a folder of projects that are relevant to whatever you are mentally prepared to work on. So I have top-level folders for each of my Areas of Focus. These are things that can't be "done" but are still important. "The David" would say these are

> important spheres of work and life to be maintained at standards to "keep the engines running."

I have the following folders for *Areas of Focus*:

-   **Personal**  
    This includes things like finances/health/chores/obligations/planning/etc. Examples:

    -   Fix Printer
    -   Sell Old iPhone
    -   Clean ScanSnap
    -   Christmas Shopping
    -   Shopping (single-action list)
    -   Music to Download (single-action list)

-   **Work**  
    This includes things that I am obligated to do as an employee.

-   **Software Development**  
    Programming is not only my job, it's also my biggest pass-time. At first this was a trouble-point for me because software development is a hobby of mine that I do at home. Moreover, I work as a software engineer, so a lot of the things I do in my free time are relevant to my job. I could have a more hierarchical structure:

        Software Development/
        ├── Home
        └── Work

    but I tend to "fiddle" too much if I have too much hierarchy. Just "keep it simple, stupid." I don't use nested folders.

    I have lots of personal coding projects and things that I want to research and learn and try, so when I get in the mood to sit down and write some code, I want to focus on only software development and not worry about what's going on with other personal or work issues.

    Examples:

    -   Synchronized Cross-\*nix Shell Profile
    -   Add CSV-\>Table Support to Markdown
    -   Rails 3 Blogging App
    -   Learn git

-   **Review**  
    This is really a sort of "meta area of focus." I use it when doing reviews. It carries one very important project "Recurring OmniFocus Organization" that I will discuss in the *Reviews* section as well as some Someday-Maybe, single-action lists such as

    -   Software to Look At
    -   Get Back (items lent to others)
    -   On Hold
    -   Someday/Maybe
    -   Articles to Read
    -   Books to Read
    -   Single-Action Projects  
        (some tasks really do require just one action!)

-   **Static Lists**  
    This actually goes *against* the OmniFocus paradigm slightly, but I'm a grownup and can break the rules if I want to. This folder contains lists that are *not* actionable. In fact, the lists are comprised of items that I never want to go away.

    Examples:

    -   Trigger List
    -   Project Planning Model
    -   Things I Won't Do Again

    Initially I was storing these lists in text files, but it's much more convenient to have everything I need for reviewing already in OmniFocus. This folder "belongs" in the *Review* folder, but again that's too much hierarchy and opportunity to fiddle for me.


## Reviews

## Someday-Maybes

There are two ways of handling someday/maybes in OmniFocus:

1. Create a project and mark it as "On Hold" (this becomes a "Maybe") project.

    I use this for a few projects that I like to think about--add ideas, plans, actions, etc., but that I don't really have time to work on them at the moment.

    <img src="./OnHold.jpg" alt="Mark on Hold or Set Start Date" style="float: right; margin: 0 0 1em 1em" />
    Mark projects as "On Hold" with inspector (⇧⌘I) in two ways:

    1. Change the project's status to *Paused*. I do this for projects that I haven't committed to actually ever completing but have thought about what I would need to do to get started on them. I also mark some projects that I've started as *Paused* if my priorities change and I want to "re-evaluate" the project later.

        Examples:

        -   Port the jekyll project to Java and Perl
        -   Learn the Guitar

    2. Change the project's start date to some date in the future. I do this for projects that I know I will someday want to complete, and I put the start date to a reasonable time when I think I will be ready to do so. <br style="clear:right" />


2. Make a Single-Action List at the top-level of your Library called *Someday/Maybe*. These are for one-off projects or ideas that I don't want to lose but that I also don't want to fully develop right now.

    I review this list during my reviews. If the project has become interesting or exciting, I'll promote it to a 'real' project and flesh out some actions and ideas. If it's still not something I want to work on, I'll mark it as "On Hold," and this becomes a project as in case (1).


## Perspectives

TODO: move this lower

I wish there was a way to have "not" conditions in OmniFocus Perspectives. I want, e.g. "*Home* and not *Home/Chores*" for things that I need to do at home but aren't as humdrum as chores.

### Treading Water

### Home

### Work

## Gotchas

Here's a list of things that I struggled with at first:

### Lists of Things to Research and Learn

Examples:

-   Books to read or buy
-   Programming languages to learn
-   Domain names to register
-   Topics to look up on wikipedia
-   Products to look up online
-   Blog posts & articles to read
-   Podcasts to listen to
-   Blog posts to write

These all represent *potential* projects or things that I want to get to or think about or *whatever*. The point is that these are *exactly* "Someday/Maybe"s! There are two ways you can handle them:

1.  Have a Single-Action List for each set.

    This is what I do. It has the advantage that you can set the review period differently on each list, but it has the disadvantage that you have more lists to maintain.

    I put these Single-Action Lists inside the folder for the Area of Focus to which they pertain. (E.g., I have a *Programming Languages to Learn* Single-Action List inside my *Software Development* folder.) Then whenever I'm in the mood to do some coding, I just Focus on my *Software Development* folder and see what appeals to me most: either tackling the next-action for an already-defined project or picking up a new language.

2. Put all of these items as groups within the main *Someday/Maybe* list.

    I don't like doing this because it makes my Someday/Maybe list daunting so I end up not looking at it which means there's gaps in my system and I lose ideas.


The idea also occurred to me that I could think of these as "things to think about," and the items could be, e.g., "Think about learning C++," and I could set this up to be a repeating action. I tried this for a while, but I forgot to set some items to repeat so I lost some of them and started distrusting this method. And even then, having a next-action be "Think about learning X" is way too heady for when you're in the daily grind: you only want to think about these things when you're doing your reviews, and so it makes sense to have it be an item on a list that you really only pay attention to during reviews. (Now you see why I had to start over so many times.)

### Old, Incomplete Projects

I have an old Subversion repository that I've kept for a few years with probably a hundred projects lurking inside of it. Most of them I have zero intention of coming back to or even referring to. Until recently, it's been a real sore spot for me: I don't want to delete it since it does have some good work that I might one day want, and I don't want to trawl through it and have yet another list of "Abandoned Coding Projects" to maintain.

What I did instead was to put all of these projects into my Someday/Maybe list.

## My System

So here's how this all fits together.

### The Tools

-   OmniFocus for day-to-day task management.

    I use the "Clip-o-Tron" (or whatever Omni calls it). Go to Preferences → Clippings. I have the shortcut set to ⇧⌘0. Then any time I want to come back to something later, I just highlight it and press ⇧⌘0 to put it in my Inbox. Whatever you have highlighted goes into the notes section of the task, and it usually is able to pull in a link back to the original content. This is super handy for email if you use Mail.app since it links back to the original message--click on the link and it opens Mail. This has gotten me to start using Mail.app for my gmail instead of the web interface because it's so fast and useful.

    I synchronize my database with my work laptop and my iPhone, so I like to keep my database lean. This means that I try to clip as little actual content as possible. Usually no more than a sentence or two (and I usually delete the formatting with ⌃⌘⌦). I think OF has the ability to store whole files in the database, but OF is a task manager and not a file manager. Use a file manager to manage files, you nut job. Just clip enough content to give you the context you need to make the task actionable.

- Evernote for clippings and reference. I have an "Inbox" notebook that all clippings go to by default, and I have a weekly-recurring task to empty this notebook into my "Reference" notebook. (I only have two notebooks: "Reference" and "Inbox".  This is very helpful.)  Evernote is an ugly, dog-slow beast, but it does hold on to lots of things, it synchronizes well, and it's easy to get stuff into Evernote. So it serves as a good reference archive. I wouldn't use it to "compose" a list (or anything, really) since it seems very easy to "lose" things in Evernote. Personally I hate tags--too loose-knit for me--and the distinction between notebooks and tags and... it's a mess.

- [Notational Velocity](http:) synchronized with [SimpleNote](http:) and Dropbox for quick reference and project support. I like to keep the number of notes in Notational Velocity to under 25 or so. This program is lightning-fast and stays in sync with my iPhone when used with SimpleNote.

    This is one tool that I really like but whose precise place in my system I'm still trying to define.

- Dropbox keeps all my important documents. I have the following structure within Dropbox (abridged, of course):

        ~/Dropbox
        ├── Archive
        │   ├── AT&T
        │   ├── Allstate Renters Insurance
        │   ├── Cablevision
        │   ├── Cigna
        │   ├── Geico
        │   ├── School
        │   └── VW Golf
        ├── Inbox -> /Users/ryan/Documents/Inbox
        ├── Projects
        │   └── OmniFocus Guide
        │       ├── OmniFocus Guide.txt
        │       └── OnHold.jpg
        └── Text
            ├── Git Notes.txt
            ├── Retirement Plans.txt
            └── Scala Notes.txt

    *Archive* is for personal/home documents. I have a folder for each past/present area of focus in there.

    *Projects* is for current projects. Once I finish a project, I move it to the relevant area of focus folder within *Archive*.

    I don't keep much within my *Home/Documents* directory. Everything goes into Dropbox for backup, synchronization and mobile access.

- Fujitsu ScanSnap S300M for all paper materials. I have a folder in my *Documents* directory called *Inbox* where newly-scanned documents go. I have a weekly-recurring task to empty this Inbox folder into other folders on my Dropbox account after they've been run through OCR and renamed appropriately.


## Case Studies & Workflows

### I come across an article I'd like to read if I have time

Clip to Evernote. Save with Instapaper so it shows up on my Kindle, and finally clip the headline/link into OmniFocus.


* * * * *

One of the areas where I still struggle with OF is reorganizing and re-prioritizing -- general "refactoring" if you will. And I think my problem is just imprecise usage.

The fuzzy-matching--type "htp" to get "Home:Take Piano Lessons"--afforded throughout is nice but only works on the Folder:Project level, not on the Folder:Project:Subtask level. So if I need to 'look up piano teachers' as part of my 'Take Piano Lessons' project and I have an Inbox item to look at a specific piano teacher that a friend recommends, I have to assign the task to the 'Take Piano Lessons' project and then manually move the action-item to the subtask. Moreover, the parent subtask information is almost completely hidden in Context mode. This means I have to either create true sub-projects via folders (an organizational burden when reviewing/completing and gaining perspective) or add enough parent-subtask information in the action items so as to make the parent's information obvious (and thereby obviating the hierarchy in the first place). (This is exacerbated by the latest release's seemingly random inability to reorder projects via ⌃⌘↓ in the sidebar.) Either way it's dangerous waters when trying to come to grips with anything other than the simplest of projects.

I suspect some of these issues are addressed in the iPad version (which I don't own because I don't own an iPad), but I still find myself struggling with what I think I *should* have mastered by now.

This makes me think I am not using the features to the best of their abilities or that somehow the disconnect is on my end and with my own implementations. The "OmniFocus, GTD, and You" guide along with Don McAllister's screencasts are very good at selling the kool-aid, but the examples are always a little too "spherical cow in a vacuum" to be useful in mastering workflow. The forums are nice but are piecemeal and generally lack cohesion.

This is why I would really like to see some more "use cases" along with real-world projects, perspectives, and workflows. I have even considered documenting my own "system" (as it were) replete with my actual database document for inspection and comment, but I was turned off by the thought of having to remove information I didn't want in the wrong hands. The Omni blog seems like an obvious voice for this.

Now that I've bought the kool-aid, I find myself needing help in avoiding the act of spilling it all over myself. I know I'm not alone in these sentiments, and I hope that those of us fumbling in the corner with blastin'-cherry-red all down our fronts can be somehow salvaged à la monkey-see-monkey-do.

TODO: finish
