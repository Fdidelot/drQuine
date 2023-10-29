#include <stdio.h>

/* I'm a comment */
#define MACRO
#define CONTENT "#include <stdio.h>%1$c%1$c/* I'm a comment */%1$c#define MACRO%1$c#define CONTENT %2$c%3$s%2$c%1$c#define MAIN int main(){FILE *fd = fopen(%2$c./Grace_kid.c%2$c, %2$cw%2$c);fprintf((FILE *)fd, CONTENT, 10, 34, CONTENT);return 0;}%1$c%1$cMAIN%1$c"
#define MAIN int main(){FILE *fd = fopen("./Grace_kid.c", "w");fprintf((FILE *)fd, CONTENT, 10, 34, CONTENT);return 0;}

MAIN
