#define _GNU_SOURCE
#include <dlfcn.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <errno.h>
#include <stdio.h>

static int deny(const char *fn) { fprintf(stderr, "[NET-BLOCK] %s blocked\n", fn); errno = EPERM; return -1; }

int connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen) {
	return deny("connect");
}

ssize_t send(int sockfd, const void *buf, size_t len, int flags) {
	return deny("send");
}

ssize_t sendto(int sockfd, const void *buf, size_t len, int flags, const struct sockaddr *dest_addr, socklen_t addrlen) {
	return deny("sendto");
}

int getaddrinfo(const char *node, const char *service, const struct addrinfo *hints, struct addrinfo **res) {
	fprintf(stderr, "[NET-BLOCK] getaddrinfo(%s,%s) blocked\n", node?node:"", service?service:"");
	errno = EAI_FAIL;
	return EAI_FAIL;
}
