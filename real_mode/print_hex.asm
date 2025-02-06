; nasm
[bits 16]

; code
print_hex_bios:
    push ax
    push bx
    push cx

    mov ah, 0x0E                ; print mode
    mov al, '0'                 ; hex prefix
    int 0x10
    mov al, 'x'
    int 0x10

    mov cx, 4                   ; counter. 4 nibbles in hex

    print_hex_bios_loop:
        cmp cx, 0
        je print_hex_bios_end

        push bx

        shr bx, 12              ; shrink to right to get ending bits at first: 1010 0101 1100 1000 => 0000 0000 0000 1010

        cmp bx, 10
        jge print_hex_bios_alpha
            ; byte in bx < 10
            ; 0 to al, add bl, get ascii num
            mov al, '0'
            add al, bl
            jmp print_hex_bios_loop_end

        print_hex_bios_alpha:
            ; bx = / > 10  ====== letter
            ; substract 10, add to 'A', get A-F
            sub bl, 10
            mov al, 'A'
            add al, bl

        print_hex_bios_loop_end:
            int 0x10

            pop bx
            shl bx, 4 ; restore old bx, then make the third part the last by shifting to left: 1010 0101 1100 1000 => 0101 1100 1000 0000

            dec cx ; decrement counter

            jmp print_hex_bios_loop

print_hex_bios_end:
    ; restore and return
    pop cx
    pop bx
    pop ax

    ret
    
