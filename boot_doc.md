The bootloader docs.

This file has multiple catogories. These are split with tabs. No tab line is the line for categories. 1 tab line is meant for entries in this category, usually the name of a function. 2 tab line is meant for information about above entries. Each entry should have: Name, Info, Args, Return, Usage. Each of these can have tabs for explaining parts of these, in exceptions of the "Usage" entry. This entry is only code, so tabs or colons and other special characters in this guide doesnt matter in the tab space of "Usage". "-none" in all entries except of "Usage" means nothing was specified, or it doesnt exist.

1. Printing:
    mPrint:
        Name: mPrint
        Info: Main Print Function.
        Args:
            bx: text
                must have '0' at the end
        Return:
            -none
        Usage:
            msg:    db `example`, 0
            mov bx, msg
            call mPrint
            