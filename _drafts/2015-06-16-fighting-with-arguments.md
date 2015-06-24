---
layout: post
title:  "Descriptive Function Names and Fighting with Arguments!"
date:   2015-06-16 13:58:00
categories: codingfails
---
I wrote this article with some funniness at first but as I got further the rabbit hole got worse :flushed:

The crime?

`propertyObj` and `userObj` are the entire JSON object describing the property and the user.

These are being sent back and forth on EVERY request :worried:

What is the server even doing?? I can spoof the server all day with fake user objects..

Why do we even have a security layer???? 

On top of the security breach, if I turn off my phone and log into my Desktop. NONE of the data will persist..

0/10 worst user experience ever :astonished:

```javascript
    saveWishListForBuyer: function(){
        var dataObj = {};

        //thisFn_1, and thisFn_2, such descriptive names! 
        //I hate to be the one trying to edit this code.. oh wait...

        var thisFn_1 = function(){
            dataObj.property = listingDetailsHandler.propertyObj;
            dataObj.recommendedFor = listingDetailsHandler.userObj;
            dataObj.recommendedBy = listingDetailsHandler.userObj;
            dataObj.notes = $("#wishList_notes").val() != ""? $("#wishList_notes").val() : null;
        };

        var thisFn_2 = function(){
            var method_type = "POST";
            var part_url = "dashboard/saveWishList";
            var content_type = "application/json";
            var data_type = "json";

            //This line might as well get its own page!
            //I feel like I'm having a fight with someone just reading this many arguments..

            sendRequest(method_type,part_url,dataObj,content_type,data_type,undefined,listingDetailsHandler.saveWishListFail,$.getCookie("userAuthToken"), function(bln, res){

                //So we got a NodeJS style promise but didn't handle the error case.. 
                //Its not like http calls ever fail, right?? sigh..
                listingDetailsHandler.saveWishListSuccess(res);
            });
        };

        //All that work just to chain 2 http promises with no error handling in between?
        $.when(thisFn_1()).then(thisFn_2());

    }
```
