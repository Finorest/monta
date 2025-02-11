;nasm
[bits 32]

; code

clean_protected:                                                                ; clear vga memory by inserting spaces
    pusha

    mov ebx, vga_extent
    mov ecx, vga_start
    mov edx, 0

    clean_protected_loop:
        cmp edx, ebx
        jge clean_protected_done                                                ; while edx < ebx

        push edx

        mov al, space_char
        mov ah, style_wb

        add edx, ecx
        mov word[edx], ax

        pop edx

        add edx, 2

        jmp clean_protected_loop

clean_protected_done:
    popa
    ret


; storage
space_char:                     equ ` `