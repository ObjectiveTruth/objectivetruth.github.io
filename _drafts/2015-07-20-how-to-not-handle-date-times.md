---
layout: post
title:  "How to not handle date/times"
date:   2015-07-20 13:58:00
categories: codingfails
---
Date/time handling in todays globalized world is a GIANT paint, this is how NOT to handle it

##Date/Time theory

Okay, so at some point in every developers career they will have to deal with Date/Time. The issue starts simple enough, until you add timezones.

Okay, managable? What about when countries arbitrarily change their timezones after an uprising?

Starting to sweat? Now try going back in time, to before the timezone change..

Leap seconds? Leap years? Gregorian Calendar? Julian Calendar....

I'll spare some of the details but here's an EXCELLENT overview of WHY its such a pain and why the best policy is to LET SOMEONE ELSE DO IT :hear_no_evil:

[![Date/Time Nightmare](http://img.youtube.com/vi/-5wpm-gesOY/0.jpg)](https://www.youtube.com/watch?v=-5wpm-gesOY)

##The Rub

So, you've realized how much of a pain it is and you've chosen a strategy, now please STICK TO IT. :rage:

Here's the information that's received from the server. 

All in fairly standard **ISO 8601** format used natively by MySql, Javascript and many others

```javascript
"schedule":{
   "start":"2015-06-23T11:30:00.000-04:00",
   "end":"2015-06-23T12:00:00.000-04:00",
   "slotDuration":"0:30:00",
   "requestingUserId":1,
   "title":"Canceled"
}
```

Now this is tricky business, we're dealing with scheduling across the country possibly. At the very least we should honor timezones..

**NOPE**

In the confirmation backend implementation, created by the same user mind you, they completely strip off the information and post it as is :dizzy_face:

Completely defeating the purpose. I'm sure they just got fed up and though, well, this project PRRRRRROLY won't reach further than this timezone, so it'll be fine... *don't worry!*

RIGHT... :tired_face:

```javascript
selectedShowingObj.schedule.start = moment(showingsHandler.showingObj[selectedID].schedule.start).format("YYYY-MM-DD HH:mm:ss");
```

That same selectedShowingObj is the pushed back to the confirm route which uses Javas Simple Date Formatter expecting suprise suprise the stripped format

```scala
val formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")

//Later in the JSON reader. Yes i know this code has other issues too.. Internal Server Errors all over the place
fromBlock -> formatter.format(wishList.schedule.get.start.map(dt => dt.toDate).getOrElse(None)),
```

toDate assumes the current timezone regardless of where the request was sent from...

##Conclusion

If you're doing to use Time/Dates for scheduling, here's what you should do

1. Pick a Library that takes care of this, Moment.js, JodeTime are great examples

2. STICK TO IT :rage:

Cheers :godmode:
