#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>

int main(void)
{
	int i = 5;
	char *s="#include <stdio.h>%1$c#include <string.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c#include <stdlib.h>%1$c%1$cint main(void)%1$c{%1$c%2$cint i = %5$d;%1$c%2$cchar *s=%3$c%4$s%3$c;%1$c%2$cchar file_name[11];%1$c%2$cchar exec_name[8];%1$c%2$cchar cmd[50];%1$c%1$c%2$csprintf(file_name, %3$cSully_%%d.c%3$c, i - 1);%1$c%2$cint fd = open(file_name, O_CREAT | O_RDWR, S_IRWXU);%1$c%2$cif (fd > 0)%1$c%2$c{%1$c%2$c%2$cdprintf(fd, s, 10, 9, 34, s, i - 1);%1$c%2$c%2$cclose(fd);%1$c%2$c%2$cif (i > 0)%1$c%2$c%2$c{%1$c%2$c%2$c%2$cstrncpy(exec_name, file_name, 7);%1$c%2$c%2$c%2$csprintf(cmd, %3$cgcc -Wall -Wextra -Werror -o %%s %%s%3$c, exec_name, file_name);%1$c%2$c%2$c%2$csystem(cmd);%1$c%2$c%2$c%2$cif (i > 1)%1$c%2$c%2$c%2$c{%1$c%2$c%2$c%2$c%2$csprintf(cmd, %3$c./%%s%3$c, exec_name);%1$c%2$c%2$c%2$c%2$csystem(cmd);%1$c%2$c%2$c%2$c}%1$c%2$c%2$c}%1$c%2$c}%1$c%2$creturn (0);%1$c}%1$c";
	char file_name[11];
	char exec_name[8];
	char cmd[50];

	sprintf(file_name, "Sully_%d.c", i - 1);
	int fd = open(file_name, O_CREAT | O_RDWR, S_IRWXU);
	if (fd > 0)
	{
		dprintf(fd, s, 10, 9, 34, s, i - 1);
		close(fd);
		if (i > 0)
		{
			strncpy(exec_name, file_name, 7);
			sprintf(cmd, "gcc -Wall -Wextra -Werror -o %s %s", exec_name, file_name);
			system(cmd);
			if (i > 1)
			{
				sprintf(cmd, "./%s", exec_name);
				system(cmd);
			}
		}
	}
	return (0);
}
