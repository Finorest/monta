; nasm:
[bits 16]
[org 0x7C00]

; stack
mov bp, 0x0500
mov sp, bp

; code:
mov byte[boot_drive], dl

mov bx, msg1                    ;print 16bit BIOS int
call print_bios

mov bx, 0x0002                  ;starting sector to load
mov cx, 0x0001                  ;number of sectors to load
mov dx, 0x7E00                  ;save to 0x7E00

call load_bios                  ;load more code 16Bit BIOS

call elevate_bios               ;go to 32 bit

jmp $                           ;loop

; includes:
%include "real_mode/print.asm"
%include "real_mode/print_hex.asm"
%include "real_mode/load.asm"
%include "real_mode/gdt.asm"
%include "real_mode/elevate.asm"

; storage:
msg1:               db `\r\nWelcome.`, 0
boot_drive:         db 0x00

; essentials:
times 510-($-$$) db 0x00
dw 0xAA55

; Begin 32 bit. Only 32 bit asm here.

bootsector_extended:
begin_protected:

call clean_protected

mov esi, protected_alert
call print_protected

jmp $

; 32 bit includes
%include "protected_mode/clear.asm"
%include "protected_mode/print.asm"

;storage
vga_start:                  equ 0x000B8000                          ; vga location
vga_extent:                 equ 80 * 25 * 2                         ; vga memory (80 wide, 25 height, one char is 2 bytes)
style_wb:                   equ 0xA3                                ; text style :D

protected_alert:        db `Entered 32 bit.`, 0


; essentials(1):
times 512-($-bootsector_extended) db 0x00