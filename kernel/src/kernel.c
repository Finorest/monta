#include <driver/vga.h>

int main() {
    set_cursor_pos(0, 0);

    clearwin(COLOR_BLK, COLOR_LCY);

    const char *first = "The advanced vga driver works! (maybe) ";
    putstr(first, COLOR_BLK, COLOR_LCY);

    const char *second = "It also wraps properly (maybe) (i hope)";
    putstr(second, COLOR_BLK, COLOR_LCY);

    const char *third = "But sadly dont scroll yet ;(";
    putstr(third, COLOR_BLK, COLOR_LCY);

    return 0;
}