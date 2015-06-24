---
layout: post
title:  "Look at me, I use promises! I'm fancy...!"
date:   2015-06-17 13:58:00
categories: codingfails
---
This code started off with me getting excited. They knew about promises.

It quickly descended into an exercise in patience and article writing :flushed:

```javascript
    //Firstly, naming aint bad, not sure what a handler is, but I can do this
    //*inhale* *exhale*
    resetHandler: function(){

        //Cool, they're using promises, this is a good start!
        var deferred = new $.Deferred();

        //Okay so we're instantiating a bunch of objects...
        //Not quite what a promise was intended for but okay, lets go with it...

        wishListHandler.wishListObj = undefined;
        wishListHandler.archivedWishListObj = undefined;
        wishListHandler.activeWishListObj = undefined;
        wishListHandler.simpleWishList = undefined;
        wishListHandler.arrayOfActiveAddresses = undefined;
        wishListHandler.gComputedDistance = undefined;
        wishListHandler.gComputedWishList = undefined;
        wishListHandler.overlayDialog = undefined;
        wishListHandler.starterLocation = undefined;
        wishListHandler.recommendedObj = undefined;
        wishListHandler.ratedWishList = undefined;
        wishListHandler.ratingInterval = undefined;

        //Wait, what?  Where's the promise??
        //Are you kidding?
        //This promise ALWAYS resolves correctly? why not just use a regular function call??
        deferred.resolve();
        
        //Why even bother using a promise?? I'm going on a limb and HOPING, this was a hack
        //Because the original function used a promise.. but even in that UNLIKELY case...
        //wtf this code bro?
        return deferred.promise();
    }
```
