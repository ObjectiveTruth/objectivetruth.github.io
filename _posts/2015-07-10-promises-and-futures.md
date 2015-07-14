---
layout: post
title:  "Promises and Futures Explained in Scala"
date:   2015-07-10 13:58:00
categories: Scala
tags:
- Promises
- Futures
- Scala
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

##Which one should I use?

Short answer, **Futures** 

Long answer, it depends.:trollface:

You can find this question repeated many times on Stackoverflow.com with the best answer being here 

http://stackoverflow.com/questions/18960339/clarification-needed-about-futures-and-promises-in-scala)

###Main difference:

**Promises** - Can be completed by client

**Futures** - CANNOT be comppleted by client

###Why is this useful?

If you are composing futures and returning them to the user, you *probably* never want them to complete it on their own. This would mess up your code. So instead give them a future which they can compose as they like, but they can't complete it. Here's an example:

```scala
def getPromise(): Promise[String] = {
    val p = Promise[String]
    Future {
        Thread sleep 1000
        p success "I'm done!"
    }
    p
}

//Can give this to client but they can complete it whenever they want which is bad! 
getPromise() success "Not if I complete it first! muahahaha"
```

The solution is to convert your Promise into a future

```scala
def getFuture(): Future[String] = {
    val p = Promise[String]
    Future {
        Thread sleep 1000
        p success "I'm done! Haha And nobody can complete me except me!"
    }
    p.future
}

//Can give this to client and they won't be able to complete it as future doesn't have a `.success()` function

getFuture.onSuccess(println(_)) //Can only use the Future, yay!
```

##Conclusion

That's the basics of `Promises` and `Futures` in Scala. In my everyday I use `Futures` almost exclusively.

The real meat of `Futures` and `Promises` is their composability. You dont have to do error handling and crazy stuff when you make them.

You can compose them anyway you like and have the end user unbox it only when they need it. 
So if there are errors on the way to getting the final result, they will accumulate and you can deal with them then.

This allows for WAYYYY easier code that you can reason about and thus become more agile when dealing with system changes

They aren't perfect but for the most part they work beautifully. I'll be writing some articles on composability patterns coming up which is the real fun part

:godmode:








