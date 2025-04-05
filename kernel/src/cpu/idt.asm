[bits 64]

global IDTLoad
IDTLoad:
  push rbp
  mov rbp, rsp
  
  mov rax, [rbp + 8]
  lidt [rax]
  
  mov rsp, ebp
  pop rbp
  ret