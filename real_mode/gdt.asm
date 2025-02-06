gdt_32_start:


gdt_32_null:
    dd 0x00000000
    dd 0x00000000

gdt_32_code:
    dw 0xFFFF                                               ; limit
    dw 0x0000                                               ; base
    db 0x00                                                 ; base
    db 0b10011010                                           ; flags
    db 0b11001111
    db 0x00                                                 ; base

gdt_32_data:
    dw 0xFFFF                                               ; limit
    dw 0x0000                                               ; base
    db 0x00                                                 ; base
    db 0b10010010                                           ; flags
    db 0b11001111
    db 0x00                                                 ; base

gdt_32_end:


gdt_32_descriptor:
    dw gdt_32_end - gdt_32_start + 1                        ; size of gdt
    dd gdt_32_start                                         ; start of gdt


; pointers to code and data
code_seg:               equ gdt_32_code - gdt_32_start
data_seg:               equ gdt_32_data - gdt_32_start

