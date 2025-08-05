if [ $1 -eq 1 ]; then
    echo "Compiling and emulating with qemu..."
else
    echo "Compiling without running..."
fi

(nasm -f bin src/bootloader/boot.asm -o res/boot.bin)

if [ $1 -eq 1 ]; then
    sh emul.sh
else
    echo "Compiling completed without running."
fi