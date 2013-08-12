draLinux quickstart
===================

### Who is this guide aimed at?

This quickstart is aimed for people who already have experience with linux
command line and know what they are doing there. Reading this guide before
starting to use draLinux is not required but is a good thing to do.

### Assumptions I make on this guide

I assume you're running on qemu and using a i686 build of draLinux, available
from my site or by building it yourself with default options, although most
advice will probably also work on other architectures and emulators.

Obtaining draLinux
------------------

There are two ways of getting draLinux, either pre-compiled binaries or building
from source yourself. For someone who only wants to play around with draLinux
I'd recommend pre-compiled binaries. However, if you want to hack draLinux and
for example add new packages to build system I'd recommend grabbing yourself
sources and building from source.

### Pre-compiled binaries

Pre-compiled binaries are .tgz files that contain `run-qemu.sh`, `dralinux.img`
and `vmlinuz`. A .tgz corresponding to latest git revision should be avaiable at
`http://norttimc.dy.fi/~nortti/dralinux/dralinux-i686.tgz` unless I have network
trouble.

### Compiling from source

To compile draLinux from source do the following (it needs genext2fs and
resize2fs):

    $ git clone git://github.com/JuEeHa/dralinux.git
    $ cd dralinux
    $ make

This should create `dralinux.img` and `vmlinuz` you can use by running
`run-qemu.sh`. (Of course, this requires qemu.)

First startup
-------------

### Setting keymap

On first startup draLinux will ask your for a keymap. This is done with a shell
script `/etc/selectkmap.sh`, which may cause the startup seem to hang. In that
case, just press enter and it should re-display the promt. Currently draLinux
only ships with `fi` and `us`. If you use any different keymap and would like
to have it in draLinux please contact me.

So, what can I use this thing for, anyways?
-------------------------------------------

Currently, not much. draLinux does, however ship with a gcc (4.2.1) that can
produce executables linked against musl libc. I'd have more stuff but currently
I can't get network to work. If you can help please contact me.
