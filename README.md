# Faceblock.
Facebook for tinfoil hats.

![Trollol](http://i.imgur.com/UgiW8.png)

## What is this?
Faceblock started out as my little side project, 
to see if I could harvest all the precious data that
would get lost, if I would just block all requests my
browser would make to the Facebook like button infrastructure.

## How does it work
Pretty easy. You let facebook point to the box you run 
faceblock on. Fire up CouchDB and you're done.

```
127.0.0.1 www.facebook.com facebook.com
```

### Embeds

Once started, faceblock will keep track of most of Facebooks
shiny buttons, embeds, iframes, popups, etc.

At the moment there is support for 

* like.php
* likebox.php
* fan.php
* photo.php