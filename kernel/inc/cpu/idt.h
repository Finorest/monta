#ifndef __CPU_IDT
#define __CPU_IDT

#include <types.h>

#define KERNEL_CS 0x08
#define INT_ATTR 0x8E
#define IDT_ENTRIES 256

typedef struct __attribute__((packed)){
    u16_t limit;
    u64_t base;
} idt_register;

typedef struct __attribute__((packed)) {
    u16_t base_low;
    u16_t cs_selector;
    u8_t  zero;
    u8_t  attributes;
    u16_t base_middle;
    u32_t base_high;
    u32_t reserved;
} idt_gate;

extern idt_gate main_idt[IDT_ENTRIES];
extern idt_register main_idt_reg;

void set_idt();
void set_idt_gate(u8_t gate_number, u64_t handler_address);

#endif