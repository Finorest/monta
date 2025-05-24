power_key_reboot:
    xor ah, ah
    int 0x16

    jmp 0x0FFFF:0
    hlt
    cli