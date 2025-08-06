[bits 16]

mode_up_32b:
    cli

    lgdt [gdt_32b_descriptor]

    mov eax, cr0
    or eax, 0x00000001
    mov cr0, eax

    jmp gdt_32b_code_loc:pm_init

    [bits 32]

    pm_init:
    
    mov ax, gdt_32b_data_loc
    mov ss, ax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov esp, 0x90000

    jmp pm_begin
