# 1) - Add/Remove Linux Kernel Modules

List current modules
```
$ ls /lib/modules/$(uname -r)
```

List all drivers for various devices
```
$ ls /lib/modules/$(uname -r)/kernel/drivers/
```

Add a Module/driver called hid
```
# modprobe hid
```

Find out info about the loaded module
```
# modinfo hid
```

List all loaded modules
```
# lsmod
```

Remove a module 
```
# modprobe -r lsmod
```

# 2) - Build Linux Kernel Module Against Installed Kernel 

Install kernel headers
```
apt-get install linux-headers-$(uname -r)
```

Change the Makefile to use current kernel build directory 
```
ls -d /lib/modules/$(uname -r)/build
```

Create the make file for hello.c program pointing to this directory
```
vi Makefile
obj-m += hello.o
 
all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
 
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
```
```
obj-m := hello.o
KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)
default:
        $(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
```
Compile
```
$ make
```
load Linux Kernel module

```
# modprobe hello
```
