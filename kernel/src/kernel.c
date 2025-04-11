#include <driver/vga.h>
#include <cpu/isr.h>

int main() {
    ISR_Init();
  
    set_cursor_pos(0, 0);
    clearwin(COLOR_BLK, COLOR_LCY);

    const char *first = "\n\n\nThe advanced vga driver works! (maybe) ";
    putstr(first, COLOR_BLK, COLOR_LCY);

    const char *second = "\nWith tabs \t and new line";
    putstr(second, COLOR_BLK, COLOR_LCY);

    const char *third = "\nAnd scrools properly hopefully maybe propably perhaps i hope";
    putstr(third, COLOR_BLK, COLOR_LCY);

    return 0;
}