; nasm
[bits 32]

; code
detect_lm_protected:
    ;stage 1. cpuid
    pushad
    pushfd
    pop eax

    mov ecx, eax
    xor eax, 1 << 21
    push eax
    popfd

    pushfd
    pop eax
    push ecx
    popfd

    cmp eax, ecx
    je cpuid_not_found_protected

    ; stage 2. cpuid extended
    mov eax, 0x80000000
    cpuid
    cmp eax, 0x80000001
    jb cpuid_not_found_protected

    ;stage 3. Detect support of 64bit using cpuid extended
    mov eax, 0x80000001
    cpuid
    test edx, 1 << 29
    jz lm_not_found_protected

    popad
    ret


cpuid_not_found_protected:
    call clean_protected
    mov esi, cpuid_not_found_str
    call print_protected
    jmp $


lm_not_found_protected:
    call clean_protected
    mov esi, lm_not_found_str
    call print_protected
    jmp $


; storage
lm_not_found_str:                       db `Long mode not supported on this machine.`, 0
cpuid_not_found_str:                    db `Cpuid or cpuid extended functions not found on this machine.`, 0