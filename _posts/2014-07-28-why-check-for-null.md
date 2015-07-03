---
layout: post
status: publish
published: true
title: Why Check for null?
author:
  display_name: Miguel
  login: ObjectiveTruth
  email: j.mendez@rogers.com
  url: ''
author_login: ObjectiveTruth
author_email: j.mendez@rogers.com
wordpress_id: 276
wordpress_url: http://www.objectivetruth.ca/?p=276
date: !binary |-
  MjAxNC0wNy0yOCAxNTowNTowNiAtMDQwMA==
date_gmt: !binary |-
  MjAxNC0wNy0yOCAxOTowNTowNiAtMDQwMA==
categories:
- Tutorial
tags:
- Android
- NPE
- null pointer exception
- adMob
- adView
- Singleton
- reddit
---
![Null-Pointer-Exception-Crunchify](http://www.objectivetruth.ca/wp-content/uploads/2014/07/Null-Pointer-Exception-Crunchify-238x300.jpg)</h2\>

Intro
 I'm fairly active over at r/androiddev and someone asked about why
check for null? 

I remember asking the same questions when I first started but after a
while it just becomes part of your every day routine with android, check
out how and when to check for null

I've seen a common complain between the android and iPhone dev community
that iPhone you don't have to check for null, when you need or reference
something that you except it always returns it (guaranteed apparently).

On android, the system is much more complex and with increase complexity
means more points of failure.

(shout out to crunchify for the featured image)



Why check for null in the first place?
 Bottom line, checking for null avoids unsightly NPE(null pointer
exceptions) when your user does something you never expected or even the
system didn't expect would ever happen.

In the reddit comment I answered, the example was using Google's AdMob
with an adView. Below is the sample code, the question and my response:

```java
    package com.google.example.gms.ads.banner;
    import com.google.android.gms.ads.AdRequest;
    import com.google.android.gms.ads.AdSize;
    import com.google.android.gms.ads.AdView;
    import android.app.Activity;
    import android.os.Bundle;
    import android.widget.LinearLayout;
    /**
     * A simple {@link Activity} that embeds an AdView.
     */
    public class BannerSample extends Activity {
      /** The view to show the ad. */
      private AdView adView;
      /* Your ad unit id. Replace with your actual ad unit id. */
      private static final String AD_UNIT_ID = "INSERT_YOUR_AD_UNIT_ID_HERE";
      /** Called when the activity is first created. */
      @Override
      public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // Create an ad.
        adView = new AdView(this);
        adView.setAdSize(AdSize.BANNER);
        adView.setAdUnitId(AD_UNIT_ID);
        // Add the AdView to the view hierarchy. The view will have no size
        // until the ad is loaded.
        LinearLayout layout = (LinearLayout) findViewById(R.id.linearLayout);
        layout.addView(adView);
        // Create an ad request. Check logcat output for the hashed device ID to
        // get test ads on a physical device.
        AdRequest adRequest = new AdRequest.Builder()
            .addTestDevice(AdRequest.DEVICE_ID_EMULATOR)
            .addTestDevice("INSERT_YOUR_HASHED_DEVICE_ID_HERE")
            .build();
        // Start loading the ad in the background.
        adView.loadAd(adRequest);
      }
      @Override
      public void onResume() {
        super.onResume();
        if (adView != null) {
          adView.resume();
        }
      }
      @Override
      public void onPause() {
        if (adView != null) {
          adView.pause();
        }
        super.onPause();
      }
      /** Called before the activity is destroyed. */
      @Override
      public void onDestroy() {
        // Destroy the AdView.
        if (adView != null) {
          adView.destroy();
        }
        super.onDestroy();
      }
    }
```

The question:
I am curious why are you doing if (adView !=null) adView.destory();</em> and likewise for all activity calls. I have seen that before. I checked Android reference on AdView</a> and it just calls mAdView.pause();</em>, mAdView.destroy();</em>, etc.</blockquote>
My response:


This is just good practice. Its a common complaint with android that even though you think something will NEVER, ever, EVER! be null.. there will be some fringe case where it will be null and the user will get an unsightly crash (wop wonnn...)
You should especially do this when you're working with Views, or activities, or well lots of things. Lets say there's a moment when an activity is queued to be destroyed and the add is still loading, and the ad(being a good citizen) takes it upon itself to self destruct.
By the time the onDestroy gets called, your adView no longer exists. So when adView.destroy() gets called, you'll get a NPE(null pointer exception).
When I first started I didn't understand it either, but the more you do live apps you'll get these very strange NPEs that can be avoided by checking for null.</blockquote>
</div>
</div>
 
When and where to check for nulls?</h2>
I've come to the conclusion that you should check whenever you receive a reference for something you did NOT control, is transient(can be destroyed at any time),  or is not a system Singleton.
Examples of places you must check for null (not exhaustive list):

Views</li>
Activities</li>
Fragments</li>
Strings</li>
Intents Bundles</li>
</ul>
Something important to note is when referencing an activity from within a listener. This you have to be very careful with.. are you sure it has to be there?
Can the activity be destroyed before the listener has been called or destroyed?
Examples of where not to check for nulls:

AppWidgetManager.getInstance()</li>
context.getSystemService(Context.ALARM_SERVICE)</li>
PreferenceManager.getDefaultSharedPreferences(this);</li>
</ul>
The list of what not to check is fairly large but you can get the idea, a system service is something the system controls and there is always at LEAST 1 of them.
