---
layout: post
status: publish
published: true
title: PendingIntents, Dalvik, and RemoteViews
categories:
- GlympseWidget
tags:
- PendingIntent
- Dalvik
- RemoteViews
- Permissions
- paperwork
- customs
- broadcast
- Intent
- filter
---
My most popular blog post on the subject of intents, widgets and permissions.

##Intro

I'm almost at the end of making the widget, but I'm going back to some
things I've learned on my way. Also, I'm hoping to get access to the
glympse inner workings to make the widget even better but that's to come
later.

##Widget, Remote Views and Dalvik

First things you must understand:

Dalvik is the Android Virtual Machine. It basically handles your
code when it executes.

Each application is given its own process that it can manage. Normally
all your code for a simple app runs in its own process (example:
com.objectivetruth.uoitdcbooking).

HOWEVER, widgets are a bit different. The code executes in your own
process (com.objectivetruth.glympsewidget in my case) BUT the VIEW is
handled by the Home Screen Process or Lock Screen Process
(depending where the widget resides).

Now, for security reasons you can't access things that are part of
another process. This is good, but we have to find a way around it...

When you want to update your Widget's View you need to use a
RemoteView

RemoteViews are NOT Views. They are a set of configurations and
functions that execute the request on your behalf.
 Example:

```java
//Getting instance of the AppWidgetManager who will actually change the
//view on your behalf.
AppWidgetManager appWidgetManager = AppWidgetManager.getInstance(context);
//Create a RemoteView targeting your Widget's Layout
RemoteViews views = new RemoteViews(context.getPackageName(), R.layout.main);
//RemoteViews has a set of commands for common view requests
//Here, we are changing the Text of a TextView in the R.layout.main layout
views.setTextViewText(R.id.textview1, "updated text");
//Because the View doesn't belong to your process you need the App Widget
//Manager to do it on your behalf
appWidgetManager.updateAppWidget(appWidgetId, views);
```

##PendingIntents and Broadcasts

First, why would you use this?

These are Implicit Intents are are used when you want a widget to send a message to itself. Such as a button click to have the widget launch a webpage. More on this in the next post. (Big topic). OnClickListener is a perfect example of all of this.  

Usage PendingIntents> are intents that are executed on your behalf. They basically allow you to temporarily give another process permission to use your code. This has to do with the above because Dalvik doesn't let other apps do things to your apps unless you authorize it, hence PendingIntents are born.
 
Best analogy I can think of is customs paperwork for a car being transported

The paperwork (PendingIntent) allows other processes to execute/use your Intent(the car). The car(your Intent) won't be able to go with anyone unless they have paperwork (PendingIntent) attached.

You get a PendingIntent by calling getBroadCast(). This is like looking through all the filling cabinets at the customs office to see if that paperwork has already been done. If it has, then just get an instance of it, otherwise create a new one.

This is very important when working with multiple remote views or multiple widget instances (this will be in another post...). For now we're working with 1 widget.
 
The below code illustrates Broadcast, pending intents nicely when you want to setOnClick behavior for a RemoteView such as a widget to update itself.

```java
//Create an Intent as normal with the action being something you can
//catch later in the appropriate activity, more on that below.
//I suggest using something unique such as com.my.packagename.action
Intent myIntent = new Intent("com.my.packagename.action");
//Create a PendingIntent by calling getBroadcast
PendingIntent pendingClearScreenIntent = PendingIntent.getBroadcast
    (context, 0, clearScreenIntent, PendingIntent.FLAG_UPDATE_CURRENT);
//RemoteView created earlier
views.setOnClickPendingIntent(R.id.clearbutton, pendingClearScreenIntent);
//then pass off the RemoteView to the AppWidgetManager</pre>
```

##Catching the PendingIntent

In the android manifest here is where you catch the PendingIntent and send it to the AppWidgetProvider

```xml
    android:name=".ApplicationGlympseWidget"
    android:icon="@drawable/ic_launcher"
    android:label="@string/app_name"
    android:theme="@style/AppTheme" >
    
        
            
        </intent-filter>
        
            android:resource="@xml/widget_info"/>
    </receiver>
```
 
I'll write a whole post on AppWidgetProvider but here's a great starter tutorial to get you up to speed

[![](http://img.youtube.com/vi/p_ZjPb_opVQ/0.jpg)](http://www.youtube.com/watch?v=p_ZjPb_opVQE)
