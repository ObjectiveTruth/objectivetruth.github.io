---
layout: post
status: publish
published: true
title: Fountain Code - The Beginnings
categories:
- FountainCode
tags: []
---
Miguel and I, Shaine, have been given the topic on algorithms.  From
hours of scouting the net we came across Fountain Coding.  Before
getting into the heavy details of what this is the basic concept can be
described as a depressing day in the rain.

You are holding a bucket while standing outside in the rain with no
umbrella. The bucket must be filled up to a certain amount and you must
hold it in place until you have enough water to fill said bucket. In
this scenario the rain acts as the Fountain Code and the bucket is the
network receiver.  Each droplet is a packet being sent to the receiver
and in the standard protocol for sending packets there is a rate loss of
packets. This means that packets will be sent and can end up not
reaching the destination thus terminating the transmission.  With
Fountain Coding the packets are guaranteed to get to the receiver
because of the limitless amount of transmissions it does. In other
words, the droplets that miss the bucket dissipate, and then there are
new droplets of either the exact same weight or different are sent again
to the bucket until the bucket relays that it has received as much as it
needs to make up the amount.

This is the basic concept of Fountain Coding to our understanding.  In
the future, we will talk about the different types that follow under
Fountain Coding such as, LT Code and Raptor Code.
