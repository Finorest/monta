[bits 64]

extern ISR_Handler

QWORD_SIZE:         equ 0x08
REG_SIZE:           equ 0x78

%macro PUSHALL 0
  push rdi
  push rsi
  push rdx
  push rcx
  push rax
  push r8
  push r9
  push r10
  push r11
  push rbx
  push rbp
  push r12
  push r13
  push r14
  push r15
%endmacro

%macro POPALL 0
  pop r15
  pop r14
  pop r13
  pop r12
  pop rbp
  pop rbx
  pop r11
  pop r10
  pop r9
  pop r8
  pop rax
  pop rcx
  pop rdx
  pop rsi
  pop rdi
%endmacro

%macro ISR_CALL 1
  PUSHALL
  
  ; some things that sysv_abi defined
  mov rdx, rsp              ; rdx should have the stack pointer
  mov rdi, [rsp + REG_SIZE] ; rdi should have int num
  mov rsi, [rsp + REG_SIZE + QWORD_SIZE]    ; rsi should have err code
  
  call %1
  
  POPALL
%endmacro

%macro ISR_NOERR 1
  global ISR%1
  ISR%1:
    push qword 0        ; error code
    push qword %1       ; int number
    ISR_CALL ISR_Handler
    
    add rsp, 0x10
    iretq
%endmacro

%macro ISR_ERR 1
  global ISR%1    ; This pushes error code.
  ISR%1:
    ; err code is already pushed automatically
    push qword %1
    ISR_CALL ISR_Handler
    
    add rsp, 0x10
    iretq
%endmacro

ISR_NOERR 0
ISR_NOERR 1
ISR_NOERR 2
ISR_NOERR 3
ISR_NOERR 4
ISR_NOERR 5
ISR_NOERR 6
ISR_NOERR 7
ISR_NOERR 8
ISR_NOERR 9
ISR_ERR 10
ISR_ERR 11
ISR_ERR 12
ISR_ERR 13
ISR_ERR 14
ISR_NOERR 15
ISR_NOERR 16
ISR_NOERR 17
ISR_NOERR 18
ISR_NOERR 19
ISR_NOERR 20
ISR_NOERR 21
ISR_NOERR 22
ISR_NOERR 23
ISR_NOERR 24
ISR_NOERR 25
ISR_NOERR 26
ISR_NOERR 27
ISR_NOERR 28
ISR_NOERR 29
ISR_NOERR 30
ISR_NOERR 31