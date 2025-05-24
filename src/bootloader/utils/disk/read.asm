disk_read:
    push ax
    push bx
    push cx
    push dx
    push di

    push cx
    call disk_lba_chs
    pop ax

    stc
    mov ah, 0x02
    int 13h
    jnc .disk_read_end

    popa
    call disk_error_read_fail


    .disk_read_end:
        popa
        pop di
        pop dx
        pop cx
        pop bx
        pop ax

        mov bx, MSG_disk_read_success
        call mPrint

        ret


MSG_disk_read_success:              db `   Disk read passed`, 0


    
