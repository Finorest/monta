[bits 16]

print_16b:
    pusha
    mov ah, 0x0e

print_16b_loop:
    mov al, [bx]
    cmp al, 0
    je print_16b_done

    int 0x10

    inc bx
    jmp print_16b_loop

print_16b_done:
    popa
    ret


print_16b_nl:
    pusha
    mov ah, 0x0e

    mov al, 0x0a
    int 0x10
    mov al, 0x0d
    int 0x10

    popa
    ret