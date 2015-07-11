---
layout: post
status: publish
published: true
title: UI Mega Patch (1.12) Part I
categories:
- UOITDCLibraryBooking
tags:
- Android
- Picasso
- Runtime Polymorphism
- Kenburnsview
- XML
---
Here are few topics that I've been reading up on that are quite
interesting

I got recharged by having a couple new downloaders (that weren't
close friends) and had a lot of feedback on user experience

Haven't written a post in a while since I've been so busy on this
update


##KenBurnsView

https://github.com/flavioarfaria/KenBurnsView

Great library whipped up by this guy gives a kenburns effect (wiki
link). I came up with the idea of using this by accident for the
policies and the about section. I accidently put this as the background
and I just stared at it for like 5 minutes marveling at how awesome it
looked that I had to incorporate it.

##Technical

The library is very simple to use and I recommend putting it inside a [ViewFlipper as opposed to
a](http://developer.android.com/reference/android/widget/ViewFlipper.html "viewflipper android dev link")ViewSwitcher(recommended
in the example).

The difference in the 2 classes is the ability to add more than 2 views
(View switcher is max 2 views). Here is the XML for the ViewFlipper I
used

```xml
        android:id="@+id/viewFlipper"
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:autoStart="false"
        android:flipInterval="25000"
        android:inAnimation="@anim/custom_fade_in"
        android:outAnimation="@anim/custom_fade_out">
        
            android:id="@+id/placeholder_view"
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            android:background="@android:color/black"
            android:src="@null"/>
        
            android:id="@+id/students_background"
            android:layout_width="match_parent"
            android:layout_height="match_parent"
            android:src="@null" />    
    </ViewFlipper>
```
What is important to note is the autoStart = "false" part, what this means is that in conjunction with the Picasso library (WOW, from square) this allows you to load big images without having to worry about load times.

In the example I made a custom fade_in animation but you can use the default @android:anim/fade_in if you want to do it quickly.

##Picasso Library (From Square)

http://square.github.io/picasso/

This library will just blow anyone who uses android completely away. Its extremely simple:

```java
Picasso with(context).load("http://i.imgur.com/DvpvklR.png").into(imageView);
```

Using it with loading web images makes it a breeze in a listview even. The usage I had for it was loading images since it implements its own LRU cache. The important part is the callback interface that fires when the images has been loaded to memory or fires right away if it gets a cache hit.

I decided to use this in an application class so the same LRU cache is shared among all instances, making it even more efficient when using the same images in different views.

```java
public class UOITLibraryBookingApp extends Application {
    Picasso mPicasso = null;
 public UOITLibraryBookingApp() {
            super();
    }
 public Picasso getPicasso(){
        if(mPicasso==null){
            mPicasso = Picasso.with(this);
            return Picasso.with(getBaseContext());
        }
        return mPicasso;
    }
}
```

This means I can call this from anywhere:

```java
    @Override
    protected void onPostCreate(Bundle savedInstanceState) {
        super.onPostCreate(savedInstanceState);
        mWorker = new Worker();
        ((UOITLibraryBookingApp) getApplication()).getPicasso()
        .with(this).load(R.drawable.background_about2).into(mWorker);
    }
    public class Worker implements Target{
     @Override
        public void onBitmapFailed(Drawable arg0) {
            //Do nothing
        }
     @Override
        public void onBitmapLoaded(Bitmap bitmap, LoadedFrom loadedFrom) {
            ViewFlipper mViewFlipper = (ViewFlipper) findViewById(R.id.viewFlipper);
            mKenBurnsView.setImageDrawable(new BitmapDrawable(getResources(), bitmap));
            mViewFlipper.setDisplayedChild(1);
            mKenBurnsView.resume();
     }
     @Override
        public void onPrepareLoad(Drawable arg0) {
            //Do Nothing
        }
 }
```

What this code does is gets the Picasso instance from the applications class (which all activities extend from), and loads the image into the appropriate XML view. However you'll see the argument for .into() is a Worker class. This custom class I made implements the callback interface and by the awesome rules of Java "Runtime Polymorphism", calls onBitMapLoaded whenever the bitmap is loaded (be it from cache or from disk). This is where the kenburns is given a source, the viewflipper flipped and the kenburns effect started. To the user he gets a nice blend in and no interruption on the UI thread.. DID I MENTION PICASSO HAS ASYNCHRONOUS???? ZOMG best library ever

10/10 would use again

Gonna split this up into another post, stay tuned!
