---
layout: post
status: publish
published: true
title: Designing before you code
categories:
- iOs Programming
tags:
- iOS
- design
- hamburger
- mockup
---
When I made my first app, I took the naive approach of just starting to
code and figuring it out as I went.

This is an absolutely retarded way to work

But, I would recommend it for anyone new to building an app or any
project

Having gone through that train wreck of an experience and spending
countless hours refactoring code over and over, I will say Design is
absolutely paramount.

##Visual Design

This is why most companies have a design team.

You do not want to keep remaking GUIs in code. It is MUCH easier to move
a button a few pixels in Photoshop or even in Paint than in a live
environment.

Here's the visual design mockup I ended up with.

![macUoitDCBooking_mainscreen](http://www.objectivetruth.ca/wp-content/uploads/2015/01/macUoitDCBooking_mainscreen-e1420300531473-651x1024.png)

Looks really cruddy but I'll explain a few important details I wrestled with:

###Hamburger Menu @ Top Left

Android uses these heavily but its not common in Apple.

The problem is how do you put a menu so that you can access more
features, without "hiding" too far from a user's reach?

I settled on this because the other features aren't used very often and
if the user needs them they will hunt. I kept the important features
front and center

###Information Button and My Account Button @ Bottom

Apple loves Tab Toolbars which, is why their iPhones are so long. I
personally hate this design because it uses a lot of screen real estate
to keep these guys on screen ALL the time.

Regardless you have to think of your target audience. If you're use to
Apple's design philosphy, this will seem normal so I decided to put
these features down here instead of at the top like the android version.

 

###Logo @ Bottom Center

I wanted to incorporate the Logo in somewhere and this was the most
appropriate way according to apple.

The best design is the one you don't notice (because its so simple)
  

 

##Technical Design

This is so important but really only makes sense once you've been in
the trenches and seen how things actually work. With my experience in
android I know how MVC (model, view, controller) design philosophy works
and I know what to expect.

In my mind I already have an idea of where certain code is going without
having to power my way through it unknowing.

 
