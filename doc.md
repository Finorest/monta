The main docs.

This is a Bootable Interface (BI). Why not an operating system? Because people already have
so many requirements for a thing to be called an OS, so here it is, BI, and I dont have to 
care about what in the world people have to say.

Second thing I already propably did, and I will do intentionaly, is to break some standards.
This is my thing, I dont care what some guy working with some 1990 companies said to be 
correct, this is my thing, so I can do what in the world I want to.

This BI is split into 2 parts, bootloader, and the kernel. Generally bootloader is just 1 sector for now, but because of some things FAT32 wants it needs 2 sectors for itself - the fsinfo and backup. Fsinfo is at the sector 2, Backup at 3
(yes, I know the standard for backup is 6, but I just like above I dont care, what do they want me to do, add some code
and then when I will see "oops, I am near sector 6, I have to jump"??? No, I wont, it is at sector 3). Techinically it is
not even at sector 3, because I just fiiled it with zeros, so maybe in future, the space is here. Kernel is after sector 
3 excluded. 