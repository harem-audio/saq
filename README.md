# why?

Cross compiling for ARM MCUs (or pretty much anything) sucks.

You can use whatever IDE your MCU manufacturer puts out, which is also likely
to suck and probably only runs on windows.

For ARM, there's mbed, which looks pretty nice on paper but throws a bunch
of unnecessary shit on top in the name of IoT. Plus at this point the new
yotta build system, which is supposed to be totally-awesome-for-real-trust-me-guys,
doesn't really support much stuff out of the box. I don't want to have to download
*another goddamn package manager*. For the time being, it kinda sucks.

There are, or could be, some conglomeration of cmake files for this, but cmake
can be pretty nonsensical. Lastly there are a gorillion makefile/autoconf setups
out there, but I cannot stand make and all things make related.

So I guess I'll roll my own. As far as I'm concerned all of the existing
systems make things way more complicated than they should be. This shit isn't
rocket surgery; all I should have to do is point out what the target system is
and maybe some directories.
There's a reason arduino is so popular/successful and it's not because of
great hardware or pricing...

# why not?

Insert that xkcd about competing standards here.
I'm probably going to be the only person using this, so I really don't care.
Why am I even writing this?
