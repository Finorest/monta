ASM=nasm
SRCd=src
BUILDd=build

$(BUILDd)/img.img: $(BUILDd)/boot.bin
	cp $(BUILDd)/boot.bin $(BUILDd)/img.img
	truncate -s 1660k $(BUILDd)/img.img

$(BUILDd)/boot.bin: $(SRCd)/boot.asm
	$(ASM) $(SRCd)/boot.asm -f bin -o $(BUILDd)/boot.bin
