; nasm
[bits 32]

; code
print_protected:
    pusha 
    mov edx, vga_start

    print_protected_loop:
        cmp byte[esi], 0                                ; if char = 0 stop
        je print_protected_done

        mov al, byte[esi]
        mov ah, style_wb

        mov word[edx], ax

        add esi, 1
        add edx, 2

        jmp print_protected_loop

print_protected_done:
    popa
    ret