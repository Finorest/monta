#include <cpu/idt.h>
#include <types.h>
#include <util/binary.h>

IDTEntry g_IDT[256];
IDTDescriptor g_IDTDescriptor;

void IDTLoad() {
  g_IDTDescriptor.Ptr = (u64_t) &g_IDT;
  g_IDTDescriptor.limit = (256 * sizeof(IDTEntry)) - 1;
  
  __asm__ volatile ("lidt (%0)" : : "r" (&g_IDTDescriptor));
}

void IDT_SetGate(int interrupt, u64_t address, u8_t flags) {
  g_IDT[interrupt].BaseLow = (u16_t) (address & 0xFFFF);
  g_IDT[interrupt].SegmentSelector = KERNEL_SC;
  g_IDT[interrupt].Reserved = 0;
  g_IDT[interrupt].Flags = flags;
  g_IDT[interrupt].BaseMiddle = (u16_t) ((address >> 16) & 0xFFFF);
  g_IDT[interrupt].BaseHigh = (u32_t) ((address >> 32) & 0xFFFFFFFF);
  g_IDT[interrupt].Reserved1 = 0;
}

void IDT_EnableGate(int interrupt) {
  FLAG_SET(g_IDT[interrupt].Flags, IDT_FLAG_PRESENT);
}

void IDT_DisableGate(int interrupt) {
  FLAG_UNSET(g_IDT[interrupt].Flags, IDT_FLAG_PRESENT);
}

void IDT_Init() {
  IDTLoad();
}
