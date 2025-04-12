#!/bin/bash

if test -f os.img
then
    qemu-system-x86_64 -drive file=os.img,format=raw -s -S --no-reboot --no-shutdown &
    gdb -ex "file kernel/kernel.elf" -ex "target remote localhost:1234" -ex "symbol-file kernel/kernel.elf"
else
    sh build.sh

    qemu-system-x86_64 -drive file=os.img,format=raw -s -S &
    gdb -ex "target remote localhost:1234" -ex "symbol-file kernel/kernel.elf"
fi