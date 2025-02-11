#ifndef __DRIVER_VGA_TEXT
#define __DRIVER_VGA_TEXT

#include <types.h>

#define VGA_START 0xB8000
#define VGA_WIDTH 80
#define VGA_EXTENT 80 * 25

#define COLOR_BLK 0     // Black
#define COLOR_BLU 1     // Blue
#define COLOR_GRN 2     // Green
#define COLOR_CYN 3     // Cyan
#define COLOR_RED 4     // Red
#define COLOR_PRP 5     // Purple
#define COLOR_BRN 6     // Brown
#define COLOR_GRY 7     // Gray
#define COLOR_DGY 8     // Dark Gray
#define COLOR_LBU 9     // Light Blue
#define COLOR_LGR 10    // Light Green
#define COLOR_LCY 11    // Light Cyan
#define COLOR_LRD 12    // Light Red
#define COLOR_LPP 13    // Light Purple
#define COLOR_YEL 14    // Yellow
#define COLOR_WHT 15    // White

#define CURSOR_PORT_COMMAND (u16_t) 0x3D4
#define CURSOR_PORT_DATA (u16_t) 0x3D5

typedef struct __attribute__((packed)) {
    char character;
    char style;
} vga_char;

u8_t vga_color(const u8_t fg_color, const u8_t bg_color);

void clearwin(const u8_t fg_color, const u8_t bg_color);

void putchar(const char character, const u8_t fg_color, const u8_t bg_color);

void putstr(const char *string, const u8_t fg_color, const u8_t bg_color);


u16_t get_cursor_pos();

void show_cursor();
void hide_cursor();

void advance_cursor();
void set_cursor_pos(u8_t x, u8_t y);

#endif