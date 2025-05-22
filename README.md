<h1>Mulbontea - a bootable program</h1>
<b>IMPORTANT</b><br> While the main branch is the one with most features for now, my work on it has stopped. Look at a xyzy_bootloader branch, while it does not have too much functions for now, it will be existing as a main one, just when it will have at least IRQ/ISR, so when it will have more functions compared to main. <br><hr>
Hi, so this is an bootable program, basically pretty much it czn boot and setup some things that are kind of useless for now. 
Why I am writing this? Honestly I dont know. But these repositories have it, so why not me.
How to build it? What do i need to build it?
I dont know. I just know you would have to make changes to the build scrit on windows, on unix you have these package managers, like brew on macos, on linux depending apt, pacman, apk, others
So if you are on unix, just run this build script and see if it works, if not it will propably tell you what do you need.
Of course to run build script you need at least something to run .sh, bash is pretty much everywhere.
So after you have cloned this if you want for whatever reason, go to the cloned folder, and run:
<br>
<hr>

```
sh build.sh
```

<hr>
<br>
Propably all, if qemu will open and you will get things like infinite loop its my fault, sorry.
But I say if something dont know in commits usually.
Just get the latest commit if it dont have anything like bug, or to fix.
For now, so from latest time I just messed up with interrupts, so I deleted them in the latest commit (10.42, 04.04.2025, MM.DD.YYYY)
Propably last time doing something completly from one tutorial, I am going back to old method, use 5 different sources and merge it, we will see if it works I hope soon.
That is all I think, bye for now, have a good week
