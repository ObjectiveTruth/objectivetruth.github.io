---
layout: post
status: publish
published: true
title: iOS Swift vs Android Java
categories:
- iOs Programming
tags:
- Android
- iOS
- Optionals
- Named Parameters
- Cyril
- Mottier
- Swift
- Java
---
I like Swift, undoubtedly, a huge improvement over Objective-C (which looks like a
nightmare) here's my favorites when compared to Java for Android

##Things I like:

**Named Parameters**

Allows you to specify the name of the parameter in the function call.
Code Readability just went through the roof! Check out this code snippet below

```swift
//Simple Area of rectangle calculator
func printAreaOfRectangle(#x: Int, #y: Int){
    //the \ operator is an escape where you can insert
    //variables or functions to concatenate to the string
    println("Area is \(x*y)")
}
//Easy to see what's going on here
printAreaOfRectangle(x: 8, y: 5)
```

Classic example where you know you need to provide an X and Y value, but in what order? If i came back 6 months later to look at this code I'd have to delve in the documentation to know what I was trying to do. I think this comes from Javascript where you send in a JSON object with all the parameters you want used. Anyways great work Apple.
Optionals

A return type that can be nil(an error), or something useful.

This has a huge effect on stability because the language requires you to handle the nil case somehow before you can reference the object inside. This is referred to checking before un-boxing. Check the code below:

```swift
//Person's residence variable is nil (a special null for iOS which means
//"nothing here" mostly used to denote an error has occurred
class Person {
    //residence is nil because we haven't set it to something as yet
    //If we tried to access it, we'd have a crash
    var residence: Residence?
}
class Residence {
    var numberOfRooms = 1
}
var miguel = Person()
// the ! operator unboxes an optional
//This is an example of what NOT to do. You need to check for nil before
//unboxing
let roomCountBad = miguel.residence!.numberOfRooms
//Checking for nil like this before unboxing
if let roomCountGood = john.residence?.numberOfRooms {
    println("John's residence has \(roomCount) room(s).")
} else {
    println("Unable to retrieve the number of rooms.")
}
```

Essentially, you use the ? after a variable to denote that its an optional, which tells the system that there's a situation where it can be nil. This forces anyone using the function or variable later in the code to check for nil. It can be thought of as throwing an exception in Java, but much simpler.

If you've ever done Android Dev you know you need to CONSTANTLY be checking for null, even when there's no possible way for a variable to be null, check it anyways
Storyboard

Allows you to do ALOT of design through a GUI. I'm sure everyone has experienced the frustration of using the Android Visual Editor. The ease of which you can handle different device parameters and just plot down the flow of an app is incredible.

You can have the visual flow of an app done in a few minutes which this awesome tool.

##The Bad

**Restrictive**

From a first look, everything feels very restrictive which is Apple's mantra so I don't blame them.
Everything boils down to static screens with transitions between them.

On Android I felt so free to do whatever I wanted with fragments.

Here's an example of what I like about Android Fragments, maybe you can do the same on iOS but this is my limited view so far

From @cyrilmottier's blog post: Custom Animations With Fragments

Overall, I really like swift and hope to unravel more of its secrets! Come at me Apple!
