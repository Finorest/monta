[bits 16]

disk_16b:
    pusha
    push cx

    mov ah, 0x02
    mov al, ch
    mov cl, 0x02
    mov ch, 0x00
    mov dh, 0x00

    int 0x13
    jc disk_16b_err

    pop cx
    cmp ch, al
    jne disk_16b_err_sect

    popa
    ret

disk_16b_err:
    mov bx, ERR
    call print_16b_nl
    call print_16b
    jmp $

disk_16b_err_sect:
    mov bx, ERR_SECT
    call print_16b_nl
    call print_16b
    jmp $

ERR:
    db 'Disk error', 0

ERR_SECT:
    db 'Invalid number of sectors', 0
