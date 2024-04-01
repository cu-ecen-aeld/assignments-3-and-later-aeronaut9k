
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <syslog.h>
 
int main(int argc, char* argv[])
{
    openlog(NULL, 0, LOG_USER);

    if(argc < 3)
    {
        printf("Error: File path and text string arguments not provided\r\n");
        syslog(LOG_ERR, "Error: File path and text string arguments not provided");
        return 1;
    }
    else
    {
        char* writefile = argv[1];
        char* writestr = argv[2];
        syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);
        int fd, nr;
        fd = creat(writefile, 0644);
        if(fd != -1)
        {
            nr = write(fd, writestr, strlen(writestr));
        }

        if(fd == -1 || nr != strlen(writestr))
        {
            printf("Error writing %s to file %s\r\n", writestr, writefile);
            syslog(LOG_ERR, "Error writing %s to file %s", writestr, writefile);
            return 1;
        }
        close(fd);
    }

    return 0;
}