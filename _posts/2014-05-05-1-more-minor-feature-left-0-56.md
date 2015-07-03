---
layout: post
status: publish
published: true
title: 1 more minor feature left (0.56)
author:
  display_name: Miguel
  login: ObjectiveTruth
  email: j.mendez@rogers.com
  url: ''
author_login: ObjectiveTruth
author_email: j.mendez@rogers.com
wordpress_id: 136
wordpress_url: http://www.objectivetruth.ca/?p=136
date: !binary |-
  MjAxNC0wNS0wNSAyMzoxNzoxMyAtMDQwMA==
date_gmt: !binary |-
  MjAxNC0wNS0wNiAwMzoxNzoxMyAtMDQwMA==
categories:
- UOITDCLibraryBooking
tags:
- ShowcaseView
- GC_OverHeadLimiteExceeded
- GoogleAnalytics
- Syntactic
- Sugar
- Synchronized
---
![freddie-so-close](http://www.objectivetruth.ca/wp-content/uploads/2014/05/freddie-so-close.png)

Intro</strong\>
 After heavy testing, I'm quite certain you can't crash the program
unless you are actively playing with the code or doing something you
shouldn't be.. actually even then I don't think you could crash it. I
spent a huge amount of time getting GoogleAnalytics to work and man is
it ever cool.

The biggest problem I find with Comp Sci (also the most rewarding) is
that things move so fast that by the time you try to learn something,
there's a new version that nobody knows how to use as yet. That's the
issue with GoogleAnalytics. SDK 4 was recently release (like a month or
so ago) and there's little info on it. Even on stackoverflow, all the
answers are, "hey you'll find the answer on the developer link:"

https://developers.google.com/analytics/devguides/collection/android/v4/</h3\>\
 I'd like to do a full post on how to use it but right now I'm so focus
on publishing this app that its going on the back burner. I will say
though the biggest challenge I had with it was figuring out the
difference between the global\_tracker and the app\_tracker. Take a look
at this code below from the Google analytics site and I'll explain
what's going on.

```java
synchronized Tracker getTracker(TrackerName trackerId) {
    if (!mTrackers.containsKey(trackerId)) {
      GoogleAnalytics analytics = GoogleAnalytics.getInstance(this);
      Tracker t = (trackerId == TrackerName.APP_TRACKER) ? analytics.newTracker(PROPERTY_ID)
          : (trackerId == TrackerName.GLOBAL_TRACKER) ? analytics.newTracker(R.xml.global_tracker)
              : analytics.newTracker(R.xml.ecommerce_tracker);
      mTrackers.put(trackerId, t);
    }
    return mTrackers.get(trackerId);
  }
```
Okay, so synchronized is a method type which basically says, make this thread safe by only letting 1 thread access it at a time. If another thread tries to access it, make it wait. Essentially its like instant singleton in a way.  The ? and : is syntactic sugar that turns

```java
if((min >=2){
   someval =2;}else{
   someval =1}
```

into
someval = (min >= 2) ? 2 : 1;

in parenthesis is the conditional statement where after the ? on the left is if true, and on the right is if false. Very neat and very easy to read.
Okay so back to the above code.
GoogleAnalytics analytics = GoogleAnalytics.getInstance(this) is the most important part of the code. It is placed in an application class because this way EVERY activity will have it available since all activities extend from Application. The new Tracker for App_tracker is good because it allows you to monitor start and end states but global_tracker doesn't really do anything as far as I can tell. I just use the app tracker and analytics and I get all my data in real time.
My code looks like this

```java
public class UOITLibraryBookingApp extends Application {
    //initialized the tracker to null so I can check when the app is made
    Tracker t = null;
    //Logging TAG
    private static final String TAG = "UOITLibraryBookingApp";
 public UOITLibraryBookingApp() {
            super();
    }
 public Tracker getTracker() {
        if(t == null){
            GoogleAnalytics analytics = GoogleAnalytics.getInstance(this);
            t = analytics.newTracker(R.xml.app_tracker);
        }
 return t;
    }
}
```

This way I call get Tracker in my MainActivity's onCreate() to instantiate the GoogleAnalytics part. Then I can use it to build things such as:

```java
    @Override
    protected void onStart() {
        super.onStart();
        GoogleAnalytics.getInstance(this).reportActivityStart(this);
    }
    @Override
    protected void onStop() {
        super.onStop();
        GoogleAnalytics.getInstance(this).reportActivityStop(this);
    }
```

This way you call GoogleAnalytics.getInstance(this) and use the dot to see all the different things you can change (at least in eclipse it gives you all the methods you can use).
ShowCaseView GC_OverHeadLimiteExceeded BUG</span></strong></h2>
I talked about this 2 posts ago and finally got around to implementing the tutorial like Google does. The Library this guy made is INCREDIBLY awesome but has a few known issues that you have to wrestle with. Also the documentation isn't great but the javadocs are very handy in Eclipse to help guide you when it can. Here is the link again to the GitHub repository.
https://github.com/amlcurran/ShowcaseView</a></h3>
He's made a new version that literally came out a few days ago but there's little documentation and only available on Maven and Gradle. I've never used either of those and I'm using eclipse instead of Android Studio so instead of learning 2 new tools, I decided to use the still completely functional legacy version. (the only real difference is code clean up and Maven/Gradle support).
One COMMON issue with eclipse and using this library is a GC_OverHeadLimitreached Exception you get when you try to compile. Here's the link with info on it but essentially you gotta delete the Roboelectric</strong> dependency libraries. Doesn't even do anything? why is it there?
https://github.com/amlcurran/ShowcaseView/issues/108</a></h3>
This will solve it and here is an AWESOME tutorial on how to use it. Saves a ton of time and I would love to make a new updated version of it, but it gets you started.
http://forum.xda-developers.com/showthread.php?t=2419939</a></h3>
You can DL my app below to see what it looks like. I have it set to happen every time the app starts just for testing, I'll have it only show once on install when it launches.
Patch Notes 0.56</span></strong></h2>
-Google Analytics suppot added. Can see how many times its installed now! Very cool.
-Tutorial Overlay DONE. Just 3 screens so I don't overwhelm people
-Pretty sure no more crashes from adding/losing a day. Will try it all week make sure it works okay.
Finalized TODO list (last thing!):
-Implementing joining a completed Booking(why would anyone want to do this? still should add it for completeness)
Installing the .apk (UNINSTALL IF YOU HAVE A PREVIOUS VERSION)</h2>
Browse to this website on your phone and when you click the link it will ask to download/install. Probably the easiest way, otherwise you gotta download to the computer, plug in your phone and upload it manually.
P.S. as always
THIS APP IS NOT ENDORSED NOR DOES IT HAVE ANY AFFILIATION WHATSOEVER WITH UOIT. ALL OPINIONS ON THIS WEBSITE AND USAGE OF THE APP IS AT YOUR OWN RISK AND ARE NOT ENDORSED BY UOIT WHATSOEVER. THIS MEAN UOIT DOES NOT ENDORSE THIS APP NOR DO THEY ENDORSE THIS APP.
</span></h1>
Here's the link:
UOITLibraryBooking056.apk</a></h3>
~~~~
