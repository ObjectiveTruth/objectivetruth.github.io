---
layout: post
status: publish
published: true
title: Dedicated Prop Hunt Server Setup (Windows) Part III (Admin stuff)
categories:
- Tutorial
tags:
- Gmod
- Prop-Hunt
- Dedicated
- Server
- Admin
- Ulx
- ULib
---
Now that you have maps, mods, sounds and whatever craziness you found
in the workshop working, you'll probably want to get more control over
what happens on your server while its running. This is where ULX comes
in. ULX is a collection of commands that rely on ULib that gives admins
a lot of control over their server. First we'll want to install this
package then we will add ourselves to the admin group so we get access
to the commands.

##Practical

Head over to the Ulysses website and in the middle you'll see stable
builds, download both the ULib and ULX files. If you try to click the
latest files it'll give you an error at the top because you need to open
it using github (don't worry about that, use the stable versions)

1. Extract both ULX and ULib files into `c:\garrysmod\addon\`

   Your addons folder should look like this:

![garrysmod\_addons\_folder\_ulx\_ulib](http://www.objectivetruth.ca/wp-content/uploads/2014/03/garrysmod_addons_folder_ulx_ulib.png)

2. Now we need to add ourselves to the admin group. First we need to
find the ID of everyone we want as admins. We'll start with our own. Go
to your profile and look at the webpage it brings you to (copy the
string of numbers at the end)

![garrysmod\_steamID\_for\_server](http://www.objectivetruth.ca/wp-content/uploads/2014/03/garrysmod_steamID_for_server.png)

Head over to `http://steamidconverter.com/` and input the file string to get your `Steam_ID` in the format `STEAM\9:9:9999`

3. Open `c:\garrysmod\settings\users.txt` in your favorite text editor (I use SublimeText) and you'll see something like this:

![garrysmod\_server\_admin\_permissions\_blank](http://www.objectivetruth.ca/wp-content/uploads/2014/03/garrysmod_server_admin_permissions_blank.png)

Replace the highlighter areas above with your info and remove the //
(the double slashes mean, ignore this line). Here is my list to give you
an idea of what to do. Admin and superadmin can be different if you set
it up but I recommend checking out the ULX readmes for more info on
these.

![garrysmod\_users\_file\_example](http://www.objectivetruth.ca/wp-content/uploads/2014/03/garrysmod_users_file_example.png)

4. Save the changes and run your server. When you're in the game, the
server will automatically know you are the admin and you can type a slew
of commands. Here is a good primer on a lot of commands and how to bind
them for simplicity

http://steamcommunity.com/sharedfiles/filedetails/?id=154655176

The most useful of commands is ulx menu. In case you don't know, you
type these in the console using the \~ key (tilde). Here is an example
of what it should say when you get into the game

![ulx\_admin\_confirmation](http://www.objectivetruth.ca/wp-content/uploads/2014/03/ulx_admin_confirmation.png)

and here is the super useful command of "ulx menu" with tons of fun
stuff to try

![ulx\_admin\_console\_menu](http://www.objectivetruth.ca/wp-content/uploads/2014/03/ulx_admin_console_menu.png)

Check it out and have fun!

 Last part of this guide will be about changing various server variables
to make it more your own
