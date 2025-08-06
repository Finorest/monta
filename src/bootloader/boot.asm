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

call mode_up_32b

;;;;;

MSG:
    db 'hello', 0

;;;;;
jmp $
;;;;;

%include "src/bootloader/16b_modules/print.asm"
%include "src/bootloader/16b_modules/disk.asm"
%include "src/bootloader/16b_modules/gdt.asm"
%include "src/bootloader/16b_modules/mode_up.asm"

;;;;;

times 510-($-$$) db 0
dw 0xAA55

boot_ext:
pm_begin:

jmp $

times 512-($-boot_ext) db 0