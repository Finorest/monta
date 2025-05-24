.PHONY: all img kernel bootloader clean always

# Main definitions
ASM=nasm
SRCd=src
BUILDd=build

# Level definitions
SRCdBT=$(SRCd)/bootloader
SRCdKR=$(SRCd)/kernel
dIMAG=$(BUILDd)/img.img
mbBT=$(BUILDd)/boot.bin
mbKR=$(BUILDd)/kernel.bin

# Image
img: $(BUILDd)/img.img

$(BUILDd)/img.img: bootloader kernel
	dd if=/dev/zero of=$(BUILDd)/img.img bs=512 count=3320
	mkfs.fat -F 32 -n "MTEA-BI" $(BUILDd)/img.img
	dd if=$(BUILDd)/boot.bin of=$(BUILDd)/img.img conv=notrunc
	mcopy -i $(dIMAG) $(mbKR) "::kernel.bin"

# Bootloader
bootloader: $(BUILDd)/boot.bin

$(BUILDd)/boot.bin: always
	$(ASM) $(SRCdBT)/boot.asm -f bin -o $(BUILDd)/boot.bin

# Kernel
kernel: $(BUILDd)/kernel.bin

$(BUILDd)/kernel.bin: always
	$(ASM) $(SRCdKR)/main.asm -f bin -o $(BUILDd)/kernel.bin

# Always
always:
	mkdir -p $(BUILDd)

# Clean
clean:
	rm -rf $(BUILDd)/*
