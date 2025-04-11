#ifndef __CPU_ISR
#define __CPU_ISR

#include <types.h>

extern void ISR0();
extern void ISR1();
extern void ISR2();
extern void ISR3();
extern void ISR4();
extern void ISR5();
extern void ISR6();
extern void ISR7();
extern void ISR8();
extern void ISR9();
extern void ISR10();
extern void ISR11();
extern void ISR12();
extern void ISR13();
extern void ISR14();
extern void ISR15();
extern void ISR16();
extern void ISR17();
extern void ISR18();
extern void ISR19();
extern void ISR20();
extern void ISR21();
extern void ISR22();
extern void ISR23();
extern void ISR24();
extern void ISR25();
extern void ISR26();
extern void ISR27();
extern void ISR28();
extern void ISR29();
extern void ISR30();
extern void ISR31();

typedef struct {
  u64_t ds;
  u64_t r15, r14, r13, r12, rbp, rbx, r11, r10, r9, r8, rax, rcx, rdx, rsi, rdi;  // registers
  u64_t interrupt, error;             // info
  u64_t rip, cs, rflags, rsp, ss;     // pushed automatically
} __attribute__((packed)) Registers;

void ISR_Init();
void ISR_Handler(u64_t isr_num, u64_t err_code, Registers* regs);

#endif