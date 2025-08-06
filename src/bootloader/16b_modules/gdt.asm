gdt_32b:
    dd 0h
    dd 0h

gdt_32b_code:
    dw 0xffff
    dw 0x0
    db 0x0
    db 10011010b                                                                    ; flags
    db 11001111b                                                                    ; flags and the end of limit of the code segment
    db 0x0

gdt_32b_data:
    dw 0xffff
    dw 0x0
    db 0x0
    db 10010010b
    db 11001111b
    db 0x0

gdt_32b_end:

gdt_32b_descriptor:
    dw gdt_32b_end - gdt_32b - 1                                                    ; size of gdt, minus one
    dd gdt_32b                                                                      ; address of the start


gdt_32b_code_loc:       equ gdt_32b_code - gdt_32b
gdt_32b_data_loc:       equ gdt_32b_data - gdt_32b

