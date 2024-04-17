/* Disable using setjmp.h header to prevent compilation warnings. We will not use this feature. */
#define UNITY_EXCLUDE_SETJMP_H

/* Define name of external function that will be used to print test result on console */
#define UNITY_OUTPUT_CHAR(c) uart_putchar(c)

/* Header declaration */
#define UNITY_OUTPUT_CHAR_HEADER_DECLARATION uart_putchar(const char c);