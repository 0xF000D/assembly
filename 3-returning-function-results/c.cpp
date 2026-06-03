#include <stdio.h>
#include <string.h>
#include <stdlib.h>

extern "C"
{
    void asmMain(void);

    // Assembly procedure that C++ program can call
    char *getTitle(void);

    // C++ function that assembly program
    // can call
    int readLine(char *dest, int maxLen);
}

int readLine(char *dest, int maxLen)
{
    char *result = fgets(dest, maxLen, stdin);
    if (result != NULL)
    {
        int len = strlen(result);
        if (len > 0)
        {
            dest[len - 1] = 0;
        }
        return len;
    }

    return -1;
}

int main(void)
{
    try
    {
        char *title = getTitle();

        printf("Calling %s:\n", title);
        asmMain();
        printf("%s terminated\n", title);
    }
    catch(...)
    {
        printf("Some exception happened during program execution\n.");
    }
}
