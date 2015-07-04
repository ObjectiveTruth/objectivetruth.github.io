---
layout: post
status: publish
published: true
title: Scroll all the tables! (v0.53)
categories:
- UOITDCLibraryBooking
tags:
- TableFixedHeaders
- InQBarna
- StickyHeaders
- Android
---
##Intro

Huge success on the calendar home page today. Was losing steam because
of how much the old calendar view had gotten mega crowded and just
generally wasn't too thrilled with the way it looked.

My google-foo kicked in and I found exactly what I was looking for here
called "sticky headers" where a certain header doesn't move in relation
to the data. Found this amazing person on GitHub with exactly what I
needed!

https://github.com/InQBarna/TableFixHeaders

After installing the samples I just sat and starred at my computer
screen for like 5 minutes at how awesome it looked and then finding out
how easy it was to integrate. I have to say Mr InQBarna, you really
tested that code and the wrapped for it made it sooo easy to use. 

This is where the second part comes in though. The majority of the time was
spent actually trying to get a proper OnClickListener as the adapter he
has only extends BaseAdapter at the very core.

The problem with this is that it doesn't have an OnItemClickListener
like other built in adapters that give you back the item that was
clicked. I had to make my own.

```java
public class CalendarAdapter extends FixedTableAdapter {
  @Override
  public View getView(int row, int column, View convertView, ViewGroup parent) {
    convertView.setOnClickListener(new OnClickListener(){
      @Override
      public void onClick(View view) {
        new AsyncRoomInteraction(getActivity(), pageNumberInt).execute();
        });
  }
}
```
The problem is that you can't set an onClickListener for the entire table, you need to Override getView and set the onclick listener for each recycled view. If you dont know how it works, I HIGHLY recommend you check out this Google conference talk about how ListViews/GridViews are created. This understand will help you dance your way around adapters and make some cool looking dynamic lists

(watch it, bro, i even accounted for the Wadsworth constant in the youtube link)

https://www.youtube.com/watch?v=N6YdwzAvwOA&feature=youtu.be&t=2m38s

One thing you gotta remember is to setOnClickListener(null) if that view in particular is not going to have a link in it. Since the views are recycled, if you don't clear what you aren't going to use, you will get all sorts of wonky behaviors depending on which way the user wishes to scroll the screen.

##Patch Notes (v0.53)

* All dialogs can now be canceled and will cancel appropriately.

* First time roomInfo setup is cancelable too, but It will try to download every time you go back until it succeeds

* More clean up on Jsoup dependancy

* Last UI change for Calendar. Very easy to use, will have a tutorial to help at the start if people don't realize its clickable. Fun to scroll it too!

* No More orientation change related crashes, yay!

* Confirmation Dialog when you press a calendar entry

* About me page added but just the basics

##Known bugs:

* Going from 2 to 1 page causes crash, at least the inverse doesn't crash anymore, hah!
