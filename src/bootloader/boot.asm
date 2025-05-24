[bits 16]
[org 0x7C00]

; Main
main:
    ; setup regs
    mov ax, 0
    mov ds, ax
    mov es, ax

    ;setup stack regs
    mov ss, ax
    mov sp, 0x7C00                                                       ; stack grows down in memory so for now fine I hope

    mov bx, mMsg
    call mPrint

    cli
    hlt                                                                         ; the end

.loop:
    jmp .loop                                                                   ; keep cpu busy

%include "src/bootloader/utils/display/print.asm"

mMsg:       db `hii`, 0

times 510-($-$$) db 0
dw 0xAA55
