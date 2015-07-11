---
layout: post
title:  "Promises and Futures Explained Part 1"
date:   2015-07-10 13:58:00
categories: Scala
tags:
- Promises
- Futures
---
The amazing world of Asynchronous Programming made SIMPLE

##Why?

Multi-threading is the future. 

Computers are getting diminishing returns on the output of one processor, but the demand is always there for more processing power. The solution?

Put more cores on a CPU. But how do we deal with the running of programs on CPUs with different number of cores?

Creating the Threading interface and leave all the difficulty to the `Scheduler`

#Executors

When the multi-threaded problem began, the best solution was to use `Executors` that managed a group of threads refered to as a `thread pool`. 
You could make a pool, and reuse threads as needed to maximize the usage of your CPU's additional Cores. When one was done, the `Executor` would tell it what to do. 
Works like a software system `scheduler`.

This sounds like a great idea:bulb: (arguably) until you get anyting past a toy example and you begin sending information among various threads. Then your head explodes :boom:

Now you're talking about managing locks and semaphores :fearful:

Talks about a Nightmare and the decrease in efficiecy!

This leads to the next problem. How do we compose all of this without going nuts??

FUTURES and PROMISES to the rescue! :running::dash:

#Promises

The central problem to the multi-threaded issue is called **Inversion of Control**. 

You are no longer in the driver seat :red_car: of your program. You must give up control to other agents to get your work done.

A Promise is a contract that says, 

###"If you give me a callback I promise to" 

* Not call your callback too many times

* Not call your callback too FEW times

* Always complete it

###Based on this we can say, that the promise will be in either **3 states**

1. Completed, Successful

2. Completed, Failed

3. Not Completed

Now that we have something solid for our implementation to hold onto, we can compose difficult asynchronous tasks much easier (its not perfect but its a long ways from what we had before)

#Syntax

In Scala Futures and Promises are very similar and I'll talk about the difference in a moment :soon:

```scala
import scala.concurrent.{ future, promise }
//ExecutionContext is required so Scala knows where to get the threads from
//This will be implicitly added to all Promises/Futures
import scala.concurrent.ExecutionContext.Implicits.global

val promise = promise[String] //The promise will hold a string

//A future tells the System to spawn a new thread and run the code block inside it
Future{
    Thread sleep 1000
    promise success "You've just completed the promise with me in it!"
}

promise onSuccess {
    case result => println(result) //Will print out the object in the promise
}
```

**Important**

onSuccess takes a partial function and must return `Unit` (`void` in java terms). This is done on purpose because you should not use them to return values to your functions. This is because you cannot be sure which thread will be executing it so the thread may have died long ago. So then how do you compose them?

###Chaining Promises

```scala
import scala.concurrent.{ future, promise }
//ExecutionContext is required so Scala knows where to get the threads from
//This will be implicitly added to all Promises/Futures
import scala.concurrent.ExecutionContext.Implicits.global

val promise1 = promise[String] //The promise will hold a string
val promise2 = promise[Int] //The second promise 

//A future tells the System to spawn a new thread and run the code block inside it
Future{
    Thread sleep 1000
    promise1 success "You've just completed the promise with me in it!"
}

//Define the callback
promise1 onSuccess {
    case promise1Result => 
        println(promise1Result) //Will print out the object in the 1st promise
        Thread sleep 1000
        promise2 success 999
}

//Define the callback
promise2 onSuccess {
    case promise2Result =>
        println(promise2Result) //Will print out the object in the 2nd promise
}
```

But what is the difference between this and Futures?

Check out Part 2!
