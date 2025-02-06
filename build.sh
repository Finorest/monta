(nasm boot.asm)
result=$?

if [ $result -eq "0" ]
then
    echo "Build finished with success"
    (qemu-system-x86_64 -drive format=raw,file=boot)
else
    echo "Build failed. Error code: $result"
fi