---
layout: post
title:  "Ionic/Cordova 4 Month Opinion"
date:   2015-08-30 13:58:00
categories: Projects
tags:
- Ionic
- Cordova
- Angular
- Javascript
---
Ionic is a hybrid app framework that promises all, here's my opinion after 4 months of heavy usage in production

##What is Ionic?

From the `Ionic` website:

>The Ionic Platform is the first full-stack service platform for building and scaling mobile apps with HTML5 and web technologies like AngularJS.

If you're new to hybrid app development, what we are doing is opening up the browser on the user's behalf in full screen mode where they can't
press any buttons. An internal webpage is launched and the user (hopefully) doesn't realize they're inside a web browser when they click :smiley_cat:

`Ionic` bridges the gap between web and full device ready applications. Here's a simplified view of the `Ionic` stack I made to illustrate

![Ionic-Cordova-Explanation-Diagram](/images/ionic-explanation-diagram.png)

##Tech Stack Responsibilities:

###Cordova

An Interface for hooking `javascript` calls to native language function calls and vice-versa. 

Also has tools for packaging a website to be displayed as an app on a native device

###Angular

A popular web framework for creating SPAs(single page application) with internal routings. 

Follows an `MVC` pattern to organize all the code.

###Ionic

Set of `css/Js` libraries that mimic the UI widgets of native applications but built in the webstack

###Ionic Services

Fairly new as of writing but gives developers common services that speed up the time to production for developers.
  
Examples: **Notification Push Services**, **Publish Services**, etc..
  
Ionic hopes to create an ecosystem where hybrid developers come first when building their apps. 
  
Here's an write up on the [ionic blog](http://blog.ionic.io/ionic-platform-services-making-development-easier/) 
on what to expect from the team on this front, very exciting times! :confetti_ball:

##Why Hybrid over Native?

Firstly, I'll say I'm an experienced native `Android` developer and I had to learn `Js/Html/css` to fit with the tech stack of my employer.
If it were up to me I'd prefer to go native, but then again I'm not experienced with `iOS` so it was probably for the better.

In our scenario Hybrid gave several advantages:

* **Faster time to market**:running::dash:

    Startup environment means we have to move fast to get product to market.

* **Experienced Webstack developers are more prevelant**:raising_hand:

    Our current team has many experienced webstack developers that we could leverage to work on the app

* **The App can be remotely *hot* updated in the wild** :fire_engine::dash:

    Biggest feature, we wanted the app to always be updated because we would be handling sensitive information

Based on these requirements the choice was clear for the project :+1:

##Overall Opinion

Overall, I love Ionic. :heart:

I can't imagine building an app with plain old `cordova`. 
The ease of use in adding things like *proper back navigation*, *page transitions*, and soooo much more would be a full-time job in itself:worried:

All my gripes (and I have plenty) are all really related to the fundamental question of **Hybrid vs Native**. 

Native will always be better, hands down. However, if you need something out there ASAP, then you'd be crazy to choose something other than Ionic

##Gripes

Everything you try and do, you will feel like a **Second Class Citizen** :confused:.

All the mobile manufacturers are trying to actively stop you :hand:from making hybrid apps. 

You will get to know many of the popular github projects and will need to modify lots of code if you try and stray even slightly from the common path.

##Would I do it again?

Absolutely :+1:

Though, I would use Ionic for rapid prototyping and proof of concept only.

If you try and add something that's a little more complicated than the usual mobile app patterns you will be wasting time :hourglass:

One way to know if its reaching that point is to ask how many times have you asked yourself

> Can I change css based on device?

or

> I want to do some complicated animations

You miiiiight be hitting the barrier of what `Ionic` and `Hybrid` frameworks in general can offer :hammer:

Either way, Nice job Ionic :bangbang:

##Advice for people starting

Plan out your app WELL in `Angular's` `MVC` structure. I did it and it paid off HUGE :bangbang:

I cannot recommend [Joe Eames's Course](http://www.pluralsight.com/courses/angular-best-practices) on [PluralSight](http://www.pluralsight.com) enough.
He's extremely knowledgable in Angular has his experience really shines through with his best practices.

This course helped me avoid many costly mistakes. :fire:

I firmly believe that without a well throughout structure we would of slowed to a crawl during development. :turtle:

Happy Ionic-ing :bangbang:
