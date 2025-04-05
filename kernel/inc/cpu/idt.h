#ifndef __CPU_IDT
#define __CPU_IDT

#include <types.h>

typedef struct {
  u16_t BaseLow;
  u16_t SegmentSelector;
  u8_t Reserved;
  u8_t Flags;
  u16_t BaseMiddle;
  u32_t BaseHigh;
  u32_t Reserved1;
} __attribute__((packed)) IDTEntry;

typedef struct {
  u16_t limit;
  IDTEntry* Ptr;
} __attribute__((packed)) IDTDescriptor;

typedef enum {
  IDT_FLAG_GATE_64BIT_INT         = 0xE,
  IDT_FLAG_GATE_64BIT_TRAP        = 0xF,
  
  IDT_FLAG_RING0                  = (0 << 5),
  IDT_FLAG_RING1                  = (1 << 5),
  IDT_FLAG_RING2                  = (2 << 5),
  IDT_FLAG_RING3                  = (3 << 5),
  
  IDT_FLAG_PRESENT                = 0x80,
  
} IDTFlags;

void IDT_Init();
void IDT_DisableGate(int interrupt);
void IDT_EnableGate(int interrupt);
void IDT_SetGate(int interrupt, void* base, u16_t segmentDescriptor, u8_t flags);

#endif