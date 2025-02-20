#include <driver/vga.h>

int main() {
    set_cursor_pos(0, 0);

    clearwin(COLOR_BLK, COLOR_LCY);

    const char *first = "\n\n\nThe advanced vga driver works! (maybe) ";
    putstr(first, COLOR_BLK, COLOR_LCY);

    const char *second = "\nIt also wraps properly (maybe)\t\t (i hope)";
    putstr(second, COLOR_BLK, COLOR_LCY);

    const char *third = "\n\n\n\n\n\n \n \n \n \n But sadly xt and text and text \n\n\n\n\n\n\n\n\n shdjhjsh mowowowoowowowoowowowoowowooowo \n\n\n\n\n woowowoowowoowowwowoowowo";
    putstr(third, COLOR_BLK, COLOR_LCY);

    return 0;
}