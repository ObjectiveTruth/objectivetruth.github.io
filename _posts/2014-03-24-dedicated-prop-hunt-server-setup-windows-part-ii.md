---
layout: post
status: publish
published: true
title: Dedicated Prop Hunt Server Setup (Windows) Part II (Adding mods&#47;maps)
author:
  display_name: Miguel
  login: ObjectiveTruth
  email: j.mendez@rogers.com
  url: ''
author_login: ObjectiveTruth
author_email: j.mendez@rogers.com
wordpress_id: 37
wordpress_url: http://www.objectivetruth.ca/?p=37
date: !binary |-
  MjAxNC0wMy0yNCAxMzo0Mjo0MSAtMDQwMA==
date_gmt: !binary |-
  MjAxNC0wMy0yNCAxNzo0Mjo0MSAtMDQwMA==
categories:
- Tutorial
tags:
- Gmod
- Dedicated
- Server
- maps
- mods
---
Introduction
 Now that we have a server up and running and your friends have begun to
join and see how cruddy it is without anything too interesting lets move
onto adding mods (maps, sounds, gamemodes, etc..)

Practical:
 There are a few ways to get new maps. pre-Gmod13, you had to find the
files yourself and add them to your server(this is the way i'm going to
show, and I prefer it because you can edit things and have more control
over what is on your server). With Gmod13, there is the ability to sync
your dedicated server with a particular workshop collection. Here is a
link on how to do it 

First, you'll want to find the mod you want from the steamworkshop by
subscribing to it and running Gmod.\

![subscribe\_button\_click](http://www.objectivetruth.ca/wp-content/uploads/2014/03/subscribe_button_click.png)

It will download the files and store them in your Gmod directory (not
the dedicated server directory).

Steam workshop uses .gma files to store addons. To extract these to the
pre-Gmod13 files you have to use an extractor. This one is the best I've
found: Gmad

1. Download/Extract/Run Gmad. Click open (might take a while if it
found your Gmod directory and is probably parsing through all your
addons)

![Gmad\_open\_click](http://www.objectivetruth.ca/wp-content/uploads/2014/03/Gmad_open_click.png)

2. You'll be shown all the addons in your Gmod directory, select the
one you want, and press select.\
 If you don't find anything here, you can browse to your steam
directory. In windows 8, its under C:\\Program Files
(x86)\\Steam\\SteamApps\\common\\GarrysMod

![Gmad\_select\_archive\_click](http://www.objectivetruth.ca/wp-content/uploads/2014/03/Gmad_select_archive_click.png)

3. It will then show you the contents of that addon package (in this
case subway.bsp in the \\maps directory. Press Extract All and point it
to c:\\\\garrysmod\\

![Gmad\_extract\_all\_click](http://www.objectivetruth.ca/wp-content/uploads/2014/03/Gmad_extract_all_click.png)

4. That's it, now run your server and you will have the map available
for use. This will work work on any other kind of mod too of course.

How do I change the map?
 Check out section 3 on how to add ulx, an admin enhancement
library with tons of awesome options. One of which is how to change the
map/mode easily.

Continue onto Part III \>\>\></h2\>\
  
