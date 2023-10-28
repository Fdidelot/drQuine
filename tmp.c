/*Outside*/
#include <stdio.h>
int main(void)
{
	/*Inside*/
	char *s="/*Outside*/%c#include <stdio.h>%cint main(void)%c{%c%c/*Inside*/%c%cchar *s=%c%s%c;%c%cprintf(s,10,10,10,10,9,10,9,34,s,34,10,9,10,10);%c}%c";
	printf(s,10,10,10,10,9,10,9,34,s,34,10,9,10,10);
}
