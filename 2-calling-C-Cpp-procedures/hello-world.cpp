#include <stdio.h>

extern "C"
{
    void greetingAsmProc(void);
}

int main(void)
{
    printf("Calling greetingAsmProc\n");
    greetingAsmProc();
    printf("Finished executing greetingAsmProc\n");
}
