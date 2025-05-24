disk_error_read_fail:
    mov bx, MSG_disk_read_fail
    call mPrint
    call power_key_reboot


MSG_disk_read_fail:                 db `Error reading the disk`, 0