---
layout: post
title:  "New Website Redesign in Jekyll"
date:   2015-07-04 13:58:00
categories: jekyll
tags:
- Jekyll
- Sass
- Markdown
- Github
---

Jekyll is marketed as Blogging for hackers and they couldn't be more right

##The Triumph of Markdown

Jekyll is built with the extremely popular Markdown language.

A **markdown** is like a distilled version of editing. It leaves only the most used features so you can get creating content quickly and leave formatting and presentation to someone else (or do it yourself later)

The language itself is great, but its popularity rests strongly on **Github** and subsequently the [Github Flavoured Markdown Language](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

As a developer once you learn the speed gain you can get by documenting what you're doing. You dont want to spend time doing formatting to make it look pretty.

GITHUB to the rescue! You can write beautiful documents super quickly with lists, rulers, headings and the like.

**input**

```
####Markdown is Cool!

* Some bullet

* Another Bullet

1. The first step

2. The second step

```

**output**

####Markdown is Cool!

* Some bullet

* Another Bullet

1. The first step

2. The second step

---

##Jekyll + Github = Github-Pages + Free Domain

Github has chosen Jekyll to be their site generation platform. 

All those wikis that everyone's been writing on, can now be turned into a fully themed github page in less than 5 minutes.

And if you don't use the wiki feature (which you should, :grin:), as a developer you get 

1 FREE domain in the form `<username>.github.io`

##(the small catch) No plugins...:sweat_smile:

The catch (though not really), is no plugins allowed. This is because Github uses the `--safe` switch when publishing websites disabling the running of scripts. 

It sucks but I dont blame them. But like any big enough annoyance, there's a [workaround](http://drewsilcock.co.uk/custom-jekyll-plugins/)

The link above is the best article I could find on the subject.

Basic Steps:

* You must `jekyll build` your website and place the contents of `_site` that it spits out into the master branch of your `<name>.github.io` repo

* Place a `.nojekyll` in the master branch's root directory to tell Github NOT to run jekyll on it

Seems simple, and it is, but its just another build step you gotta do, which is annoying. To be honest, it was too much work. I'm using Jekyll for the simplicity of being able to just pull the repo from anywhere, make a post and publish. Adding a build step means I have to configure the machine I'm working on which defeates the point for me.

##Sass out of the box

Working with [ionic](http://ionicframework.com) I've realize the incredible power of [SASS](http://sass-lang.com)

I'd go as far as, **Never going to use CSS again** without some sort of pre-processor.

Features:

* Variables can be assigned and reused like so `$base-color` and `color: $base-color`

* Mixins are supported along with a slew of basic programming directives like `foreach`, `if`, and `for` loops

* Compass can be used to super charge your SASS and allow for relative colors. Like `:hover { @include tint($base-color, 20%);}`

The biggest pain that comes with working with any **pre-processor** is the build step. The nice thing is that Jekyll does that all for you in ITS `jekyll build` step

AMAZING:exclamation:

##Future

I'd like to make this site a place where I can link all my projects, and use it as like an online resume. The ability to link to github from another domain name is fantastic too.

You can check out how to do it here:

[https://help.github.com/articles/setting-up-a-custom-domain-with-github-pages/](https://help.github.com/articles/setting-up-a-custom-domain-with-github-pages/)
