---
layout: post
status: publish
published: true
title: UI Mega Patch (1.12) Part 2
author:
  display_name: Miguel
  login: ObjectiveTruth
  email: j.mendez@rogers.com
  url: ''
author_login: ObjectiveTruth
author_email: j.mendez@rogers.com
wordpress_id: 220
wordpress_url: http://www.objectivetruth.ca/?p=220
date: !binary |-
  MjAxNC0wNi0wNiAwMDo0NTowOSAtMDQwMA==
date_gmt: !binary |-
  MjAxNC0wNi0wNiAwNDo0NTowOSAtMDQwMA==
categories:
- UOITDCLibraryBooking
tags:
- HttpsUrlConnection
- speed
- New Relic
- Validators
- setError
- Google Analytics
---
 ![wpid-wp-1402029581703.png](http://www.objectivetruth.ca/wp-content/uploads/2014/06/wpid-wp-1402029581703-e1402029889858.png)</h2\>

Intro</strong\>
 So many topics I had to put this in another post. Working with
optimization has been a huge headache because of my lack of experience a
the time. My code has evolved so much since then.

One of the biggest grippes I noticed when people using my app was the
load time for the refresh. At first I was proud to get it down to about
8-10 seconds with as low as 4 seconds. After trying a few tricks I got
it down to average 4 seconds with as low as 2 seconds. INSANE! How did
he do it???

HttpsURLConnection:</strong\>
 Okay, first things first DO NOT USE AndroidHttpClient. This is
basically left to die back in gingerbread. Unless you want crazy
backwards compatibility, do not use it!

Here's a fragment from the original post

> Which client is best?
>  Apache HTTP client has fewer bugs on Eclair and Froyo. It is the best
> choice for these releases.
>
> For Gingerbread and better, HttpURLConnection is the best choice. Its
> simple API and small size makes it great fit for Android. Transparent
> compression and response caching reduce network use, improve speed and
> save battery. New applications should use HttpURLConnection; it
> is where we will be spending our energy going forward.
>  The usage is very simple, here's a quick snippet:
> ```java
> package foo;
> import java.net.URL;
> import java.io.*;
> import javax.net.ssl.HttpsURLConnection;
> public class JavaHttpsExample
> {
>   public static void main(String[] args)
>   throws Exception
>   {
>     String httpsURL = "https://your.https.url.here/";
>     URL myurl = new URL(httpsURL);
>     HttpsURLConnection con = (HttpsURLConnection)myurl.openConnection();
>     con.setUseCaches(false);
>     con.setConnectTimeout(8000);
>     InputStream ins = con.getInputStream();
>     InputStreamReader isr = new InputStreamReader(ins);
>     BufferedReader in = new BufferedReader(isr);
>     String inputLine;
>     while ((inputLine = in.readLine()) != null)
>     {
>       System.out.println(inputLine);
>     }
>     in.close();
>   }
> }
> ```
> The secret sauce to making this whole thing faster was the 2 lines:
> conn.setUseCaches(false);
> conn.setConnectTimeout(8000);</pre>
> UseCache basically means you gotta write to memory or disk which takes at least 2-3 seconds, and the connection timeout means that you have to set something. If you don't httpsurlconnection will block that connection making it super slow. Now its blazingly fast, Like i couldn't switch to another activity and switch back to test for crashes it was so fast, good ol testing framework had to do it. Awesome!
> New Relic</span></strong></h3>
> I'd been using Google Analytics happily since inception of this app but I saw this ad for a free t-shirt and I had to give it a try. New Relic is an analytics service that spans many platforms but of course I use it just for mobile.
> I found this graph that made me want to at least give it a try with the free account:
> </a>
> You can see that Google Analytics is used by the majority of websites on the net (probably because everyone loves and knows Google) but New Relic is used by the most successful sites. Why not give the best a try?
> It is incredible, the amount of information you get from the user and so little you have to do to get it up and running. Of course it has options for making custom alerts and hits but just the basics already gives so much especially the info on http connection speeds: something I want to ensure my users are doing well with.
> </h3>
> Validators</span></strong></h3>
> What is a validator? These classes are designed to ensure the user inputs something that makes sense. This is useful for of course SQL injection and all sorts of other malicious attacks. In my case I don't have too much to worry about except for user experience. I found while testing that people didn't know what to do when they got to the create booking screen so I tried a few libraries out:
>
>
> Android Saripaar</a></li>
> Android-Validator</a></li>
> FormValidations</a></li>
> ValidationKomensky</a></li>
> </ul>
> </div>
> You can try them yourself, they're pretty neat for big forms but for my case it was overkill and I just needed to nudge the user not hit em over the head with a hammer.
> I ended up finding
> EditText.setError("You suck");</pre>
> This is awesome because it gives you control over this stylish doodad everyone is familiar with (familiarity is important in mobile app development trust me)
> </a>
> This lets you do lots fun stuff that nudges the user as to what to write. Coupled with .addTextChangedListener() and you're golden! Check this awesome code:
>           groupNameEditText.addTextChangedListener(new TextWatcher(){
>              @Override
>                 public void afterTextChanged(Editable arg0) {
>                 }
>              @Override
>                 public void beforeTextChanged(CharSequence arg0, int arg1,
>                         int arg2, int arg3) {
>                 }
>              @Override
>                 public void onTextChanged(CharSequence arg0, int arg1,
>                         int arg2, int arg3) {
>                     int groupNameEditTextLength = groupNameEditText.getText().toString().length();
>                  if(groupNameEditTextLength > 1 && groupNameEditTextLength < 9){
>                         groupNameEditText.setError(null);
>                         checkValidBook();
>                     }
>                     else{
>                         groupNameEditText.setError(getResources().getString(R.string.groupNameValidateError));
>                         checkValidBook();
>                     }
>              }});</pre>
> You do need to call a validator function with the if statements but that's pretty easy. In my case I don't let the user proceed by disabling the create rooms button unless they clear all he errors.
>     public void checkValidBook(){
>         if(groupNameEditText.getError() == null
>                 && groupCodeEditText.getError() == null
>                 && duration_error_icon.getVisibility() == View.INVISIBLE
>                 && institution_error_icon.getVisibility() == View.INVISIBLE){
>                                     //Do something awesome
>                                 }
>         }</pre>
> Well that's enough writing for now, check out the app. I'm super happy with it so far. I've put so much work into it. I really hope its useful, I'd hate to have put so much work and it go to waste, Tell me what you think!
>  
> ~~~~
