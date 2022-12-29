# swagricator-module-demo-cli

## Introduction
This is a demo module for https://github.com/eriknl/swagricator. It provides an example of what a limited shell often available on embedded platforms looks like. The main purpose is to provide the scaffolding for building basic Swagricator modules.

## Building
Run `make` after adjusting the `CC` variable in the _Makefile_. This should cross-compile the application and generate a loadable image `module-demo-cli.img`. Note that root rights are required in order to mount the generated image and copy the application files to it.

## Running
Run this module by appending `-drive if=none,id=hd,format=raw,file=/path/to/module-demo-cli.img` to the qemu-system-arm command.
Since this is not a daemon process it must be started by running `/mnt/module/demo-cli` from a shell.

```
...
[    1.538526] Run /sbin/init as init process
Starting network...
Starting telnetd...
Loading module...
Found device node
Mounting module
[    3.501072] EXT4-fs (vda): mounted filesystem with ordered data mode. Quota mode: disabled.
running start script for module

Please press Enter to activate this console. 
/ # /mnt/module/demo-cli 
Welcome to the demo-cli shell!
> help
Commands: quit, whoami, help
> whoami
root
> quit
Bye!
/ #
```