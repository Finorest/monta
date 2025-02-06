; nasm
[bits 16]

elevate_bios:
    cli                                                     ; disable interrupts (no int handler, cpu will blow)
    lgdt [gdt_32_descriptor]                                ; load gdt

    mov eax, cr0                                            ; enable 32 bit by flipping control refister cr0
    or eax, 0x00000001                                      ; cant write to cr0 directly, so move cr0 to eax, and then move eax to cr0
    mov cr0, eax

    jmp code_seg:init_pm                                    ; "far" jump to clean cpu pipeline from 16 bit

    [bits 32]                                               ; In 32 bit now :D
    init_pm:
    ; :D. 32 bit starts here

    mov ax, data_seg                                        ; all segment registers to data segment
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax


    mov ebp, 0x90000                                        ; stack messed in elevation, so get a new one
    mov esp, ebp

    jmp begin_protected