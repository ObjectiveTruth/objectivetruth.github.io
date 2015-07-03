---
layout: post
status: publish
published: true
title: It's Happening! (0.57)
author:
  display_name: Miguel
  login: ObjectiveTruth
  email: j.mendez@rogers.com
  url: ''
author_login: ObjectiveTruth
author_email: j.mendez@rogers.com
wordpress_id: 147
wordpress_url: http://www.objectivetruth.ca/?p=147
date: !binary |-
  MjAxNC0wNS0wOSAxMjozNzo0MiAtMDQwMA==
date_gmt: !binary |-
  MjAxNC0wNS0wOSAxNjozNzo0MiAtMDQwMA==
categories:
- UOITDCLibraryBooking
tags:
- Android
- keystore
- keygen
- proguard
---
![aw\_yiss\_by\_salvador\_rudy-d5mss1s](http://www.objectivetruth.ca/wp-content/uploads/2014/05/aw_yiss_by_salvador_rudy-d5mss1s-300x201.png)</h2\>

Intro</strong\>
 AAAhhhhh yissss.

App is complete coding wise and did a dry run of the entire config
process which I will detail below. The only thing left is the app icon
which I contracted out on Fiverr. I'll write more on that when the
finished app icon comes in. I'm excited to use it for the first time.

So, the final ability to join pre-precreated rooms is done and the final
section was going through the check list. Here are the major steps and
detail about them once you have your app "complete"

KeyStore</strong\>
 You need to have a keystore that is yours and yours alone. This
basically proves that you are who you say you are. When you are
exporting to a .apk, you simply use the android default one which has
the password "android" but once you publish you need your own. Java
comes with a keystore utility called keytool. The usage of it
as essentially:

```bash
keytool -genkey -v -keystore my-release-key.keystore
-alias alias_name -keyalg RSA -keysize 2048 -validity 10000
```

Keytool is something you can use on multiple operating systems for a variety of things (signing iOS apps too). This tool is a JAVA tool not related to google. Thus you can find it under [drive]/Program Files/Java/[your jdk version]/bin/
Keep it SUPER SAFE, this is your lifeline to your copyright on the app. Once you have this you can do the regular export process in Eclipse
Proguard</span></strong></h2>
This tool is used to obfusticate your code. It is important that you realize this does NOT make your code unbreakable. If someone wants to get access to your code, they will get access to your code. However, it does stop you from being an easy target and Google makes the config file for you which saves your time in figuring it out
Here is a really good video tutorial on it for android
https://www.youtube.com/watch?v=qXsjTWX-l9A
Proguard also disables your Log calls which saves your time in going through your code. Especially if you use server interaction and send out strings in the Log.
Left to do:</span></strong></h3>
Just gotta wait on my icon to be made. I'll post back when its done!
