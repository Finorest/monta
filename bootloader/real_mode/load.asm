; nasm:
[bits 16]

; code:
load_bios:
    push ax
    push bx
    push cx
    push dx
    push cx

    mov ah, 0x02
    mov al, cl                      ; MOVING REGISTER VALUES TO NEEDED BY int. num of sectors
    mov cl, bl                      ; first sector to read
    mov bx, dx                      ; destination

    mov ch, 0x00                    ; cylinder
    mov dh, 0x00                    ; ---||--- head

    mov dl, byte[boot_drive]        ; load drive in dl

    int 0x13                        ; read int
    jc bios_disk_error              ; check for errors (1)

    pop cx                          ; check for errors (2)
    cmp al, cl
    jne bios_disk_error

    mov bx, disk_success_msg        ; success
    call print_bios

    pop dx                          ; return
    pop cx
    pop bx
    pop ax
    ret


bios_disk_error:
    mov bx, disk_error_msg          ; error
    call print_bios

    shr ax, 8
    mov bx, ax
    call print_hex_bios

    jmp $                           ; hang.


; storage
disk_error_msg: db `\r\nError with loading sectors. Code: `, 0
disk_success_msg: db `\r\nAdditional sectors loaded successfully.`, 0
