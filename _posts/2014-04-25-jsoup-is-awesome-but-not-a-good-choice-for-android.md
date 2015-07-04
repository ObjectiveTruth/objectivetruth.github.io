---
layout: post
status: publish
published: true
title: Jsoup is awesome but not a good choice for android
categories:
- Rants
tags:
- Android
- jsoup
- slow
- hatred
---
##Rant

I've been doing a lot of android programming lately and decided to take
on a screen scraping project for my school's library booking system so
anyone can use the functionality of the dated website without having to
use the dated website.

To do the screen scraping I chose Jsoup, seemed lightweight, highly
recommended and simple to use once you learn the select search tags.

HOWEVER, now that the app is done functionality-wise, I'm looking at
what can be improved and one of the first tasks was the speed of the
calendar refresher function. After timing it, it took a WHOPING **18**
seconds to scrape 3 websites for various data elements I needed. 

After loading up DDMS and analysis what what wrong, I found the parsing to
take up 85% of the clock time during the refresh operation. This is
spread out over 4 calls I made to the parse engine. I refactored and did
the searching for 2 of the parse calls by hand using good old fashion,
string splitting and LastIndexOf. 

After reducing my calls to 2, i went
down from 18 seconds to 6 seconds, a HUGE improvement. Writing to the
database takes about 1 second so I wont be touching that but next step
is to try and get the guts of the refresh operation done using LastIndexOf and subString splitting.

Also, another improvement I made was not using

`string1 = String1 + string2` in a while loop for BufferedReader. 

TERRIBLE idea on an android. As you know, java has immutable strings, so this is actually making a new string each time. This is bad news bears for the CPU and really bad for the user experience. Better is to use StringBuilder, specify the approximate size of the content to be written, and append after each .NextLine() call. This way it holds the space from the get go and only has to grab the length of string from the Buffer.`

Anyways, terrible formatting here but I made a new section here for rants. I'll clean it up later

Cheers,
Miguel
