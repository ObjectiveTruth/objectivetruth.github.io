---
layout: post
title:  "Project for PHP"
date:   2015-04-19 14:30:21
---
PHP is an exceedingly popular language that mixes some of the best elements of javascript with elements of object oriented programming.

The decision to learn PHP came from a personal project using Snapchat's undocument API.

Originally I learned and wrote a system in python based on a Github project I found but its maintainer stopped working shortly after I started, completely ignoring mine and other's pull requests. This forced me to search for a more active project.

This lead me to a fantastic project with an active community of PHP developers.

The problem is, I didn't know PHP so, like python I learned from scratch and began work.

In this report I'll talk about what I've learned so far and some of the best and worst parts of PHP.

##History

---

PHP was first developed as a server-side scripting language in 1994 by Rasmus Lerdof.

The acronym for PHP  use to stand for Personal Home Page but has now changed to mean Hypertext PreProcessor. It is now maintained by The PHP Group which rewrote alot of the core with the Zend Engine which allowed for PHP to become a much more full featured programming language. It now supports debugging, resource management, and many more artifacts modern programmers expect. This has allowed PHP to gain incredible adoption in the world.

According to wikipedia and a survey in 2013, PHP is installed on more than 240 million websites (39% of those sampled) and 2.1 million webservers worldwide.

With the ubiquity of Apache this number will still be high but other competitors in the field will surely be nipping at PHP's heels.

##Detailed Language Analysis

##Type System

---

Reference PHP systems are interpreted, however facebook (the largest proponent of PHP) and others have since created compilers for PHP. Among them are HHVM (formerlly HipHop for PHP by facebook), Phalanger (compiles to .net CIL), and Roadsend (compiles to linux and windows binaries).

In both of these instances, PHP does support type inferencing. This means the following is fine

```PHP
$myValue = 5;
$myValue = "Hello";
```

In my oppinion, type inferencing is a terrible idea for production code. It leads to strange behaviour and is very difficult to follow for someone else trying to maintain your code. 

In this case however, I found that even if I tried to use verbose type information it failed. I got strange errors. I would run this:

```PHP
public function printValue(string a){
    echo $a.PHP_EOL;
}
```

and I'd end up with errors like this

```Incorrect type string, expected string```

wat? :confused:.

##Syntax design for loops

---

The design takes heavy inspiration from Java which was probably the language du jour when designing the syntax.

```PHP
for ($x = 0; $x <= 10; $x++) {
    echo "The number is: $x";
} 
```

There is a syntactic sugar equivalent in foreach for iterating through objects in a collection.

```PHP
$colors = array("red", "green", "blue", "yellow");

foreach ($colors as $value) {
    echo "$value <br>";
}
```
##Syntax design for functions

---

Syntactic inspiration borrows heavily from object oriented java

```PHP
public function myFuncName($argument1, $argument2, $optArg1 = true, $optArg2 = false){
}
```

A nice deviation is optional arguments. If you give a value to an argument like ```$optionalArgument```, then it becomes optional. 

```PHP
//Perfectly Valid
myFuncName(1, 2);
```

The program is that it is positionally based. So if you want to not include ```$optArg1``` but include ```$optArg2```, you can't.

##Degree of support for functions as values

---

PHP supports a concept called **variable functions**. 

The interpreter can look at runtime for a function with the symbol specified.

```PHP
public function doNothing(){}

//doNothing is passed as a string but will look for it
//in the runtime function symbol table
$func = 'doNothing';
$func();
```

##Degree of support for closure

---

**Closures** are supported as of PHP 5.3 and above(5.4 is current version).

This allows for fantastic code reusage and encapsulation. Here's an example

```PHP
$user = "miguel";
 
// Create a Closure
$greeting = function() use ($user) {
  echo "Hello $user";
};
$greeting();
//prints miguel

//change global var
$user = "ken";
$greeting();
//prints miguel still

```

The **closure** is already built into the language but the keyword ```use``` allows you to add variables outside the normal lexical scope. 

##Degree of support for anonymous and higher order functions

---

Fairly new to PHP is support for anonymous and higher order functions as of PHP 5.4

```PHP
$foo = function (){echo "foo";};
$foo();
//prints foo
```

And you can use higher functions as callbacks, as you would expect

```PHP
function myHighOrderFunc($callback){
    sleep(10);
    $callback();
}

$myCallback = function(){
    echo "I'm done!";
}

myHigherOrderFunc($myCallback);
//prints "I'm done!" after 10 seconds;
```
##Other Novel Features

---

####PHP Runtime Assumptions

If PHP can't find the name of the constant it will try to recover from errors by "assuming" things based on your code. This is an interesting feature I've never seen elsewhere. Python does this a little but its not verbose so I never noticed.

```PHP
$drop = "UPDATE students";
$all = "SET grade='A+'"; //PHP can use ' inside "
$tables = "WHERE name='miguel'"
executeSQLStatement(drop . all . tables);

//Will output 
//PHP Notice:  Use of undefined constant drop - assumed 'drop'
//PHP Notice:  Use of undefined constant all - assumed 'all'
//PHP Notice:  Use of undefined constant tables - assumed 'tables'
```

At first I thought this was a nice feature, until I realized it was turning my variable names into strings! :scream:

Its nice that it attempts to recover from errors, but I think the reason this hasn't caught on anywhere else is the disasterous consequences this can have. Best case the above code crashes, worst case it drops all your data :exclamation:

####String Interpolation

Neat feature that is found (among other places) in ruby, scala, swift and PHP.

```PHP
$name = "miguel";
echo "my name is $name";
//prints "my name is miguel"
```
##Discussion on the language tools

---

The standard PHP library(SPL) is fairly good. Has many of the functions you would expect.

Using nodejs and PHP in tandem, I find the default standard libraries to be very similar. An example is the host of system processes available with functions like ```mkdir()``` and ```unlink()```.

Contains even basic data structures you can use:

* ```SPLDoubleLinkedList```
* ```SPLStack```
* ```SPLQueue```
* ```SPLMaxHeap```
* ```SPLMinHeap```
* others...

There is a strong lack of stadard dev tools that come with PHP however, the community has filled the gap really nicely.

* PHPUnit - Most popular unit testing framework for PHP

* Composer - Package manager for PHP, great tool

* Symfony - Top to bottom fully featured framework for building webapps.

* Laravel - Another fully featured web app framework.

##Community

---

PHP is very much still relevant today. The PHP Group regularly updates their project and relies strongly on community feedback.

The speed at which they update PHP to support new language staples is incredible.

For a language that started in 1994, it has managed to keep up with all modern language bells and whistles.

PHP5 was released in 2005 and it has gone through major changes. Looking at the [release schedule](http://php.net/releases/) there is a solid 1-2 month release cycle which is amazing for such an old language.

This [newest article](https://wiki.php.net/rfc/php6) was released end of 2014 and talks about the next major release with heavy emphasis on community feedback.


The most popular open source projects are those around frameworks of Symfony and Laravel discussed in the previous sections. These are general purpose but the one that gained large attention in the past 5 years would be [Wordpress](https://github.com/WordPress/WordPress) still under strong usage and development. 

###Commit history for week of April 19th 2015

![Wordpress Commit History May 2015](/assets/wordpress_commit_history_05-2015.png)

Of course the PHP conversation wouldn't be complete without involving [Facebook](www.facebook.com) which was a major advocate and proponent to PHP.

Facebook used many tricks to try and enhace the PHP workflow. They created HHVM which is a PHP compiler that runs the front end of facebook which of course gets millions of views a day.

If you're so interested, the chief technical architect did a [great presentation](www.infoq.com/presentations/php-history) on why PHP is still relevant.

I personally agree with him, its not that bad..
