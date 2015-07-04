---
layout: post
title:  "Behold the power of Vim regex!"
date:   2015-06-24 13:58:00
categories: vim
---
Recently purchased Drew Neil's Excellent [Practical Vim](http://www.amazon.com/Practical-Vim-Thought-Pragmatic-Programmers/dp/1934356980) book and its quite advanced.

One of the intermediate lessons is the use of Regex for substitute (search/replace on steroids) :+1:

You can use back sustitution to take search groups and apply it to the resulting replace operation

And here the wicked gif I made of me using this insane feature :godmode:

![behold the power of vim, plebs](/images/behold_power_of_vim.gif)

##WTF just happened?

Here's the Regex I used to swap the left and right side of assignment expression

```bash
'<,'>s/\(\s\+\)\(.\{-}\) = \(.\{-}\)/\1\3 = \2/g
```

###Range of last Visual Selection

 `'<,'>`

 When using the Visual selector(Shift-V), press colon (:). It will prepopulate the commandline with the range you've selected with the Visual Selector.

###Substitute Ex Command

`s/{match}/{replace}/{flags}` 

General form of the substitute (find/replace) command. Flags in this case is `g` meaning match ALL, if not it will stop after the first match

###Regex Match
`\(\s\+\)\(.\{-}\) = \(.\{-}\` - The meat of the search. I'll go over it one by one

* `(s+)` Make a group of all whitespace characters 

* `(.{-})` Make a group of any character but don't be greedy. Meaning it will truncate once the next part of the search is found. Otherwise the . will greedily include everything except the newline

* `(.{-})` Make the last group same as above

###Replace with Backsubstitution

`\1\3 = \2` 

General form of `\n` where n is the group number (in sequence) allows you to take search groups and use them in the replace operation. Here we take the whitespace(`\1`), add (`\3`), concatenate with " = ", and then end with the 2nd group (`\2`). 

**VOILA**:bangbang:
