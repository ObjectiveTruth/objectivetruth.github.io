---
layout: post
status: publish
published: true
title: Starting Off (v0.52)
categories:
- UOITDCLibraryBooking
tags:
- DDMS
- background
- gridview
- freddie
- mercury
- '0.52'
---
Tons of hurdles I've had to go through and still many more to come. I'll
throw the patch notes below and I'll write up on what I've been working
on related to it, mostly for fun and for posterity.

##Intro

After lots of trouble shooting and seeing the above screen for the
millionth time I'm comfortable enough to post up the fairly stable
version of the UOITLibraryBooking app i've been working on.

![crashedandroid](http://www.objectivetruth.ca/wp-content/uploads/2014/04/crashedandroid.png)

Plus feel free to comment. I doubt anyone will actually download it but
heck, it'd be cool to just give it a try and all this is really just to
learn how the heck all this stuff works. Shout out to Dr. Ken Pu for
giving me the idea to give this a go.

 

##What I've been working on today

I had a friend help me beta test the app and thankfully found an area
where I hard coded the login info using my own credentials for the
school!

Huge security issue for me! I had done it initially for testing so that
I didn't have to type in everything by hand every time but forgot to
disable it and even more so I forgot to add the dialog for
username/password.

![login\_hardcode](http://www.objectivetruth.ca/wp-content/uploads/2014/04/login_hardcode.png)

I laughed and cried when I saw this... ah sheeeeeet

Another major ongoing issue is getting rid of Jsoup (html parser) in my
code as much as possible as I voiced my frustration in the other post(I
hate Jsoup)

After checking the DDMS (debugging toolkit for android) i saw that 85%
of the time was spend in the method Jsoup.parse(htmldocument.html). I
completely cut the code out and went from average 8 seconds refresh time
to just under 3 seconds.

MEGA improvement and doesn't impact user experience very much. Now just
gotta find ways of hiding it from the user: a friend commented that if I
put in a confirmation dialog box and start the fetch right away, by the
time the user presses confirm or dismiss on the dialog box (usually 1-2
seconds) the operation is almost done and to the user experience the app
will feel more responsive.. seems contrived but may work? I have to test
it.

Last thing I've been spending time on is getting an image to span the
entire background on a grid view. I thought I'd have to chunk the image
down per gridview item but nope, just throw the background around the
entire entry in the xml and you're golden:

```xml
    android:id="@+id/calendar_gridview_actual"
    android:layout_width="1100dp"
    android:layout_height="match_parent"
    android:padding="0dp"
    android:background="@drawable/ic_freddie_success"
    >
```
I got it working with hilarious results!

##Patch Notes (v0.52)

* More Stability Improvements, shouldn't crash at all switching between screens while refreshing. Will give you a soft pop up when the refresh is done though, even if you leave the app.

* Added confirm screen for booking a room

* Still playing with the icons and formatting for the calendar screen.. not a big fan of the green check marks but I'm not quite sure what else to use, hopefully adding a background will live it up. Don't worry opacity will be low

* Removed Jsoup dependancies when booking a room for increase performance.

* Formatting issues with certain fonts have been fixed, mostly with booking a room and joining a room


##Known Bugs

* It looks like you can cancel loading tasks, but i haven't implemented it as yet, if you cancel it, it will continue

* There's an issue with refreshing when you go from 1 day available to 2 days available. You have to close  and then open the app to fix it, still working on this.

* About still doesn't work, mostly I don't know what to put in there, doesn't take long to make..figure i'd say blah blah blah, I'm a student please download my crappy app, haha.

* Can't join a previously locked in room or create a new reservation if there is another reservation being attempted in that time slot. Its grayed out so unless you try you won't notice it
