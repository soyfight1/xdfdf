#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/uio.h>
#include <pthread.h>
#include <string.h>

static int out_fd = -1;
static int in_fd = -1;
static pthread_once_t once = PTHREAD_ONCE_INIT;

static void init_logs(void) {
	out_fd = open("/workspace/work/artifacts/write.log", O_CREAT|O_WRONLY|O_TRUNC, 0644);
	in_fd  = open("/workspace/work/artifacts/read.log",  O_CREAT|O_WRONLY|O_TRUNC, 0644);
}

ssize_t write(int fd, const void *buf, size_t count) {
	static ssize_t (*real_write)(int,const void*,size_t) = NULL;
	if (!real_write) real_write = dlsym(RTLD_NEXT, "write");
	pthread_once(&once, init_logs);
	if (fd == 1 || fd == 2) {
		if (out_fd >= 0) {
			(void)real_write(out_fd, buf, count);
		}
	}
	return real_write(fd, buf, count);
}

ssize_t read(int fd, void *buf, size_t count) {
	static ssize_t (*real_read)(int,void*,size_t) = NULL;
	if (!real_read) real_read = dlsym(RTLD_NEXT, "read");
	ssize_t r = real_read(fd, buf, count);
	pthread_once(&once, init_logs);
	if (r > 0 && in_fd >= 0) {
		(void)write(in_fd, buf, (size_t)r);
	}
	return r;
}