[bits 16]
[org 0x7C00]

; FAT32 header
jmp short main      ; somehow the first entry is disassembled to this
nop

; Bios Parameter Block (BPB). Under the FAT32 header.
bpb_oem:                    db `MSWIN4.1`
bpb_bytes_per_sector:       dw 512 
bpb_sectors_per_cluster:    db 8
bpb_reserved_sectors:       dw 32
bpb_fats:                   db 2
bpb_entries:                dw 0
bpb_sectors:                dw 0
bpb_media_descriptor_type:  db 0xF8
bpb_empty:                  dw 0                ; Only in FAT12/16. This is FAT32, no not needed I think
bpb_sectors_per_track:      dw 18
bpb_heads:                  dw 2
bdb_hidden_sectors:         dd 0
bpb_large_sectors:          dd 3320

; Extended Boot Record (EBR). Under FAT32 header
ebr_sectors_per_fat:        dd 9
ebr_flags:                  dw 0001000100000000b
ebr_fatv:                   dw 00           ; i have no idea what this is
ebr_clusters:               dd 2
ebr_fsinfo:                 dw 2
ebr_bbs:                    dw 3
ebr_zero:                   dq 0
ebr_zero1:                  dd 0
ebr_drive:                  db 0x80
ebr_reserved:               db 0
ebr_signature:              db 0x29
ebr_vol_id:                 dd 0
ebr_vol_label:              db `mtea-vl-a.1`
ebr_sys_id:                 db `FAT32   `

; Main
main:
    ; setup regs
    mov ax, 0
    mov ds, ax
    mov es, ax

    ;setup stack regs
    mov ss, ax
    mov sp, 0x7C00                                                          ; stack grows down in memory so for now fine I hope

    mov bx, mMsg
    call mPrint

    mov [ebr_drive], dl
    mov ax, 1
    mov cl, 3
    mov bx, 0x7E00
    call disk_read

    hlt                                                                         ; the end

.loop:
    jmp .loop                                                                   ; keep cpu busy

%include "src/bootloader/utils/display/print.asm"
%include "src/bootloader/utils/disk/convert.asm"
%include "src/bootloader/utils/disk/errors.asm"
%include "src/bootloader/utils/disk/read.asm"
%include "src/bootloader/utils/power/key_reboot.asm"

mMsg:       db `hii`, 0

times 510-($-$$) db 0
dw 0xAA55

fsinfo_sign:                dd 0x41615252
times 480 db 0
fsinfo_sign1:               dd 0x61417272
fsinfo_free_clusters:       dd 0xFFFFFFFF
fsinfo_lookfordrver:        dd 0xFFFFFFFF
fsinfo_zero:                dq 0
                            dd 0
fsinfo_sign2:               dd 0xAA550000

; Things above have exactly 512 bytes, so its fine without filling

backup_boot_record_sector:
; I have no idea what this is so filling with 0

times 512-($-backup_boot_record_sector) db 0