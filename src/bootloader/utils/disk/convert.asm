; LBA => CHS (needed by interrupt)
disk_lba_chs:
    push ax
    push dx

    xor dx, dx                          ; dx = 0

    div word [bpb_sectors_per_track]

    inc dx
    mov cx, dx

    xor dx, dx
    div word [bpb_heads]

    mov ah, dl
    mov ch, al
    shl ah, 6
    or al, ah

    pop ax
    mov dl, al
    pop ax

    ret

