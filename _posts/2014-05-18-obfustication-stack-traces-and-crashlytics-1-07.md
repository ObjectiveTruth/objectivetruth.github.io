---
layout: post
status: publish
published: true
title: Obfustication, stack traces and Crashlytics (1.07)
categories:
- UOITDCLibraryBooking
tags:
- Config
- Android
- Crashlytics
- Obfustication
- Pro-guard
- Overdraw
- GPU
- Profiling
---
Haven't written in a little while now that the app is out and working
as "mostly" intended. There are a few things I want to mention though
that differs when working with a published app.

The pro-guard Obfuscation tool that comes with android SDK is phenomenal
but one of the default options that Google provides in the pro-guard.cfg
(config file) is to obfuscate the line numbers too. 

This is incredibly annoying for debugging published apps because the output will always say
(unknown source) so you don't even know what file it is that the error
was located in. Essentially here is what you should add to the
pro-guard.cfg when working with it

```
-keepattributes SourceFile,LineNumberTable
```

##Crashlytics

OMG, where have you been all my life. This tool is just incredible.
Crashlytics was bought by **Twitter** and is still in beta with some of its tools but gives out codes if you apply for it.

**GET IT**

http://try.crashlytics.com/

Not only is it super simple to use and install into your app but also allows it to grow as your app gains in popularity.

http://vimeo.com/92773940

I may have linked this before but this guy knows his stuff. His talk on crashlytics</strong> got me to try it and its every bit as good as he says.
Here is a screen shot of the interface</strong> which apart from being awesome is super useful because it gives you the most probably reason the crash occurred!

##Debugging for performance (Overdrawing)

There's a dude I follow on you tube that has a lot of useful tutorials and recently he talked about a few debugging options found on the phone itself that have helped me do some optimization in the backed.

**GPU Overdraw** is a very interesting option.

https://www.youtube.com/watch?v=Ar5J8tLF2mA&list=PLuR1PJnGR-IjLGs6gkl-5C0_SvMK2YH8o

Here's the issue, when you draw a background in white (lets say) and put a picture over it, there are now 2 planes that need to be drawn.

Different video cards handle this issue differently, unfortunately the chip in the android phones will draw both all the time, this is called overdraw</strong> because it has to draw the white then draw another picture ontop. This taxes the processor as you can imagine. The challenge is how to avoid overdraw as much as possible. Check the video and he has a tutorial on how to do it in the developer options in your phone.

Here is another great post on how to go about it

http://www.curious-creature.org/docs/android-performance-case-study-1.html</a>

##Color scheme index:

**No color** means there is no overdraw. The pixel was painted only once. In this example, you can see that the background is intact.

**Blue** indicates an overdraw of 1x. The pixel was painted twice. Large blue areas are acceptable (if the entire window is blue, you can get rid of one layer.)

**Green**> indicates an overdraw of 2x. The pixel was painted three times. Medium-sized green areas are acceptable but you should try to optimize them away.

**Light red** indicates an overdraw of 3x. The pixel was painted four times. Small light red areas are acceptable.

**Dark red** indicates an overdraw of 4x or more. The pixel was painted 5 times or more. This is wrong. Fix it.
