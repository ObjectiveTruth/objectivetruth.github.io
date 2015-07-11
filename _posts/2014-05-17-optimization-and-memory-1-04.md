---
layout: post
status: publish
published: true
title: Optimization and Memory (1.04)
categories:
- UOITDCLibraryBooking
tags:
- Jsoup
- ETE
- Monkey
- Adb
- Leak
- Memory
---
Now that the app has been out for a bit and gotten a few downloads I
started to get a couple crash reports back with all sorts of weird stuff
I never experienced in testing. 

Now this brought me to realizing a few things.

##Memory

Precious precious memory. Each app gets 16mb to do what it wants (not
very much). You have to be very careful with memory leaks and making
sure your objects are being garbage collected correctly.

If you're interested in learning more about how the memory is being used
and how Google implements the garbage collector, this is a fantastic
video even if its a few years old:

https://www.youtube.com/watch?v=\_CruQY55HOk

In addition to that, this blog post helps a ton in identifying memory
leaks or just memory allocation in general. I double checked and found
my program is pretty clean.

http://ttlnews.blogspot.ca/2010/01/attacking-memory-problems-on-android.html
  

##Automated Testing

After watching this excellent presentation for ETE 2014 by the guys
behind myFitnessPal on debugging and automated testing, I realized how
little testing I really did that would simulate the strangeness of the
wild. Here is the presentation

http://vimeo.com/92773940

One of the first things I did was use monkey with the adb sdk tools.
This was very insightful. Though I didn't get any crashes it gave me
confidence that if the user does decide to go insane and click like
crazy my app won't crash (theoretically).

Firstly, the adb can be found /platform-tools. Initialize with (should
show all the emulators connected)

```bash
adb devices
```

It is used to give commands to the emulator and do fun stuff with it like monkey
monkey allows you to give random commands to an app or the emulator in general with various options.
Here's a typical usage of monkey from the documentation which I used to test my app:

```bash
adb shell monkey -p your.package.name -v 2000
```

2000 is the number of random events you want monkey to execute. Its pretty hilarious looking at it and even funnier when your heart is racing hoping like hell it doesn't crash! I made a gif of it at the start of this post

##Lesson Learned

Use the alpha/beta testing options in the developer console and manage that memory wisely! Otherwise it will crash your app in a live environment.

Especially important, DON'T USE JSOUP if you value your memory.
