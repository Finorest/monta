mPrint:
    push ax
    push bx
    
    mov ah, 0x0E

    mPrint_begin:
        cmp byte[bx], 0
        je mPrint_end

        mov al, byte[bx]
        int 0x10

        inc bx

        jmp mPrint_begin

mPrint_end:
    pop bx
    pop ax
    ret