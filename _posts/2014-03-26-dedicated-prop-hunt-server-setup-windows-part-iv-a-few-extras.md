---
layout: post
status: publish
published: true
title: Dedicated Prop Hunt Server Setup (Windows) Part IV (Extras)
categories:
- Tutorial
tags:
- Gmod
- Prop-Hunt
- Dedicated
- Server
- mods
- SWEPS
- LUA
- SV
- Variables
- flashlight
- prop
- pickup
- config
---
##Introduction

You should have a good grip on alot of the functionality by now, and I
added this part just to add a few extras I found out along the way. BTW

I recommend murderer, its super fun with a group of people.

![garrysmod\_prophunt\_mainpic](http://www.objectivetruth.ca/wp-content/uploads/2014/03/garrysmod_prophunt_mainpic.jpg)

![murderer\_gmod\_admin](http://www.objectivetruth.ca/wp-content/uploads/2014/03/murderer_gmod_admin.png)

##Customization

There are a ton of these so I'll just get your started

`c:\garrysmod\cfg\` containts a bunch of txt files which describe server values

`server.cfg` is called anytime the map `changesautoexec.cfg` is called only
when the server is started.

Here is a handy site with a whole slew of sv(server values)

http://maurits.tv/data/garrysmod/wiki/wiki.garrysmod.com/indexebfc.html

If you want to change variables to a particular gamemode's rules you
should check out `c:\garrysmod\gamemodes\gamemode\`

you can open each of these files in notepad for easy editing though I
recommend Sublime (for text editing)

Here you can edit the rules specific to THAT gamemode. In general the
files that start with "sh" are those that affect everyone whereas the
ones with "cl" only affect clients.

Don't forget that most of these SVs can be changed while the game is
running aslong as your are an admin!
  

###Allowing the flashlight to be turned on:

`mp_flashlight 1`

0 means do not allow, 1 is allow. 

Default is 0 for this version of
prop\_hunt. Throw it into your game.cfg to have it start by default like
that.

![server\_game\_config\_file\_flashlight\_mp](http://www.objectivetruth.ca/wp-content/uploads/2014/03/server_game_config_file_flashlight_mp.png)

###Allow props to be picked up:

open `init.lua` in `c:\garrysmod\gamemodes\prop_hunt\gamemode\` and
edit the line where it says `GM:AllowPlayerPickup` change the return value
from false to true.

![server\_game\_config\_allow\_player\_pickup\_prop](http://www.objectivetruth.ca/wp-content/uploads/2014/03/server_game_config_allow_player_pickup_prop.png)

changed to:

![server\_game\_config\_allow\_player\_pickup\_prop\_true](http://www.objectivetruth.ca/wp-content/uploads/2014/03/server_game_config_allow_player_pickup_prop_true.png)

Don't forget to save the file and restart your server for it to take
effect.

##Conclusion:

That's the end of this guide. There's tons more to learn. If you're
looking for a way to make your own LUA scripts there are lots of
resources and you can even make your own weapons using only LUA via
SWEPS (script-weapons).

Thanks for reading and if you have any questions, comment below!

 

 
