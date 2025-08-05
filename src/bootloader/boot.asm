[bits 16]
[org 0x7C00]

xor ax, ax
mov ss, ax
mov es, ax
mov ds, ax
mov cs, ax
mov sp, 0x0500

call print_16b_nl

mov bx, MSG
call print_16b

mov bx, 0x7E00                                                                      ; my disk will be here in ram
mov ch, 0x01
call disk_16b

call print_16b_nl
mov bx, EXT_MSG
call print_16b

;;;;;

MSG:
    db 'hello', 0

;;;;;
jmp $
;;;;;

%include "src/bootloader/16b_modules/print.asm"
%include "src/bootloader/16b_modules/disk.asm"

;;;;;

times 510-($-$$) db 0
dw 0xAA55

boot_ext:

EXT_MSG:
    db 'hiiii', 0

times 512-($-boot_ext) db 0