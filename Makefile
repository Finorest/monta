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
	cp $(mbBT) $(BUILDd)/img.img
	truncate -s 1660k $(dIMAG)

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
