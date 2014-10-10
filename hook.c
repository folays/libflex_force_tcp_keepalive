#define _GNU_SOURCE
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/tcp.h>

int socket(int domain, int type, int protocol)
{
  int fd = syscall(SYS_socket, domain, type, protocol);

  if (fd >= 0 && domain == AF_INET && type == SOCK_STREAM)
    {
      int optval = 1;
      setsockopt(fd, SOL_SOCKET, SO_KEEPALIVE, &optval, sizeof(optval));
    }

  return fd;
}
