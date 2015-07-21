---
layout: post
title:  "Intermediate Promise Usage in Javascript"
date:   2015-07-20 13:58:00
categories: Javascript
tags:
- Promises
- Javascript
---
Harness the power of simply composed Async objects called Promises

##Why?

In the previous article [Promises and Futures Explained in Scala](/scala/2015/07/10/promises-and-futures.html) I talked about the need for Async programming.

Specifically Javascript was in dire need of `Promises` for a very long time. There were a couple famous Promise libraries that came into being to make up for this deficiency.

Earlier this year it was announced that `Promises` would be built into [ECMAScript 2015(ES6)](http://www.ecma-international.org/ecma-262/6.0/)! 

The reason Promises are so powerful is their composability.

Each async call doesn't have to have its own error handlers. 

Each part of the promise chain :link: does work on the result and error if required, but if it doesn't it just gets pushed to the next handler in the chain

#Promise Types

Importantly there are 2 major implementations that have gained traction. 

Difference? Position of the error callback

**Nodejs Style Promise**

```javascript
$http.get('http://google.com', function(error, result) {
    if(error) {
        console.log("There's been an error: " + error);
    }else {
        console.log("Here's the result: " + result);
    }
});
```

**A+ Style Promise**

```javascript
var httpPromise = $http.get('http://google.com');

httpPromise.get("http://google.com").then(function(result) {
    //Do work with the result
    console.log("Here's the result: " + result);

}, function(error) {
    console.log("There's been an error: " + error);
}
```

#Examples

##Catch and Chaining

Personally prefer A+ style promises because they compose nicer IMO :rainbow:

You can return promises back to promises to chain them

```javascript
$http.get('http://firstrequest.com').then(function(result) {
    return $http.post('http://secondrequest.com', result);

}, function(error) {
    console.log('An error occured in the first request, dont know about the second request!');
    
}).catch(function(error) {
    console.log('An error occured in either the first request or the second request!');
});
```

Wait, what's `catch`? You might be asking :confused:

This is **important**:bangbang:

When you use catch, it will grab all uncaught errors **INCLUDING** those that occur when the first request resolves successfully.

This means, if you some sketchy calculation with the result of the first request, and it throws an error, catch will save it, `function(error)` will NOT in this case

##Defer

**Defering** is what you do when you need to make a promise out of not so promise objects.

Example:

```javascript
//I'm using Kris Kowal's Excellent Q library for Promises(pre-ES6) 
//but all libraries should have a defer like object
function resultPromise() {
    var deferred = Q.defer();

    var result = heavyCalculation(); //Some heavy calculation
    var isSuccess = isCalculationSuccessful(result); //Check if it was successful

    if(isSuccess == true) {
        deferred.resolve(resultOfHeavyCalculation)
    }else {
        deferred.reject('There was an error, with heavyCalculation()');
    }

    return deferred.promise;  //Return the promise attached to the deferred object you made
}
```

Deferred as extremely powerful and let you create Promises out of anything.

##Over-deferring and the Famous Promise Anti-Pattern

Promises are fantastic but not fully understanding will lead to overcomplication and implementations that resemble glorified callbacks..
that's not what promises are.

Promises allow you to use a `Chain of responsability` pattern for dealing with errors.

You can check `Stackoverflow` for a slew of questions about this and here is the question I submitted which solidified the concept

[Handling promise errors in chain, am I too eager?](http://stackoverflow.com/questions/30918252/handling-promise-errors-in-chain-am-i-too-eager)

Namely you don't need to created deferred objects to handle every error, just return a new promise to the promise calls to create and chain of responsability that only needs to get handled once the result is materialized at the end of the chain.

The next secion is useful for when you need to create a promise out of a value you know will always resolve or always reject

##Promises that ALWAYS succeed or ALWAYS FAIL

Kris Kowels's Q comes with function `.resolve()` and `.reject()`

Example:

```javascript
function getMostPopularAnimalOnReddit() {
    $http.get('http://redditcat.com').then(function(result) {
        return Q.resolve(result.firstPosition);
    })
}
```

##Promises out of Independant Promises

`Q.all()` is your friend here. 

Allows you to sent out a few promises and resolve **ONLY** if they all succeed. If one fails, the entire promise fails. Very handy :smile:

Example:

```javascript
function getTwoStockValues() {
    var arrayOfPromises = [
        $http.get('http://stockmarket-one.com'),
        $http.get('http://stockmarket-two.com')
    ]
    
    return Q.all(arrayOfPromises);
}
```


#Conclusion

Hope that makes Promises a bit clearer. They are absolutely essential to working in an asynchronous environment without losing your head :bowtie:
