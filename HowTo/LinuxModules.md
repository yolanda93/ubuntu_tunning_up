# Add/Remove Linux Kernel Modules

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


