#include <cpu/idt.h>
#include <types.h>
#include <util/binary.h>

IDTEntry g_IDT[256];
IDTDescriptor g_IDTDescriptor = { sizeof(g_IDT) - 1, g_IDT };

void __attribute__((cdecl)) IDTLoad(IDTDescriptor* idtDescriptor);

void IDT_SetGate(int interrupt, void* base, u16_t segmentDescriptor, u8_t flags) {
  g_IDT[interrupt].BaseLow = ((u16_t)base) & 0xFFFF;
  g_IDT[interrupt].SegmentSelector = segmentDescriptor;
  g_IDT[interrupt].Reserved = 0;
  g_IDT[interrupt].Flags = flags;
  g_IDT[interrupt].BaseMiddle = ((u16_t)base >> 16) & 0xFFFF;
  g_IDT[interrupt].BaseHigh = ((uint32_t)base >> 32) & 0xFFFFFFFF;
  g_IDT[interrupt].Reserved1 = 0;
}

void IDT_EnableGate(int interrupt) {
  FLAG_SET(g_IDT[interrupt].Flags, IDT_FLAG_PRESENT);
}

void IDT_DisableGate(int interrupt) {
  FLAG_UNSET(g_IDT[interrupt].Flags, IDT_FLAG_PRESENT);
}

void IDT_Init() {
  IDTLoad(&g_IDTDescriptor);
}
