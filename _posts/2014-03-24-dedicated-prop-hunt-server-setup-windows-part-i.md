---
layout: post
status: publish
published: true
title: Dedicated Prop Hunt Server Setup (Windows) Part I (Getting Started)
categories:
- Tutorial
tags:
- Gmod
- Prop-Hunt
- Dedicated
- Server
---
Thanks to many popular gaming channel including SeaNanners people
have been looking for a way to setup a server and get in on
the fun. What got me into it was Prop-Hunt and setting it up wasn't
quite so easy, but once it was done, it was hilarious the
amount of fun you can have. I figure a guide would be good
since all the guides I found were outdated and had alot of
quirks you had to find out on your own.

##Introduction

I broke this up into 2 sections, **theory** and **practical**. If it were me
reading this I would jump into practical and only when I got stuck would
I read the theory to figure out what 

I did wrong. It'll take some patience but once you get it working, its a hilariously good
time!



##Practical - Windows Dedicated Gmod Server
  

1. Download SteamCMD from the [Valve Developer Community
Page (you can read about it using that link) or here's
the](https://developer.valvesoftware.com/wiki/SteamCMD "SteamCMD - Valve Developer Community Page")direct
link to the windows file

2. Extract the files into whatever folder in your C drive (I put mine
in `c:\steamcmd`)

3. Run `steamcmd.exe` and wait for everything to load and give you a
prompt

4. Type `login anonymous` without the quotes

5. Type `force\install\dir C:\` will be where the GmodDedicated Server will go (I did `c:\GmodDS`)

6. Type `app\update 4020 validate` and wait for it to install (can take like an hour, depending on internet
connection speed).

 You can close steamcmd it once its done

7. Download the Prop Hunt server files from [github
or use
this](https://github.com/xspacesoft/PropHunt "xspacesoft PropHunt GitHub")direct
link

8. When you extract the files from step 7, you will see 2 folders,
sounds and gamemodes (ignore the other files, that's used for github
stuff). Extract the 2 folders so they reside in
`c:\garrysmod\` (from step 5). In my case the sounds and gamemods
directory ended up in `c:\GmodDS\garrysmod\`

 The sounds and gamemodes file structure should look something like this(murder and terrortown are gamemodes I added after along with other sounds)

![sounds\_file\_structure\_gmodDS](http://www.objectivetruth.ca/wp-content/uploads/2014/03/sounds_file_structure_gmodDS1.png)
![gamemodes\_file\_structure\_gmodDS](http://www.objectivetruth.ca/wp-content/uploads/2014/03/gamemodes_file_structure_gmodDS1.png)

9. Make a shortcut for `srcds.exe` (its in the directory from step 5),
and click properties on the shortcut you just made.

add the following after `srcds.exe -game garrysmod  +gamemode prophunt`

![srcds\_shortctu\_properties\_prop\_hunt](http://www.objectivetruth.ca/wp-content/uploads/2014/03/srcds_shortctu_properties_prop_hunt.png)

10. Run the shortcut, edit what you like, and press Start
Server: Voila! Dedicated Server up and Running. Below are a
few Frequently asked questions.

##Frequently Asked Questions (FAQ)

* Friends can't see and/or join my server

  This is almost for sure because of port issues. 2 options (A) read a basic networking book or (B) go to portforwarding.com

* How to I setup a password for my server
  Check out my 4nd part to this guide

* I can't pickup props as Hunter or turn on my flashlight
  Check out my 4rth part to this guide

* How do I add new maps, do more advanced features?
  Check out my 2nd part to this guide

 

##Theory (more advanced)
  

* What is Gmod? 

  It's a completely stand alone game that just happens to be made as a mod of Half-Life.

* What is Prop-Hunt? 

  It's a mod (gamemode) of Gmod.

Completely dissociate Half-Life and Gmod in your head, because it
screwed me up when trying to figure out how to setup the server.\

You are running a Gmod Server which allows multiple
gamemodes, one of which is Prop-Hunt (sandbox is the standard
Gmod gamemode).

Each type of mod requires certain files and go into particular
directories:\

* sounds = `\sounds\`

* gamemodes = `\gamemodes\`

* maps = `\maps\`

Steam workshop downloads files and puts them in packages (like a .zip)
called addons. Makes it easier to add/remove.

So if you want to add something to the server you have to either
extract the files and put them in the appropriate directory
or get an auth key (I'll show that in part II)

In the steam workshop (as of writing this) there are 2-3 different
PropHunt versions. The gitHub link above is meant to be for the most
actively updated one and the one I think is the best. Also,
you're getting it right from github, so its always up to
date. I'll put it in another guide on how to keep
things updated.
