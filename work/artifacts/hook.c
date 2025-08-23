#define _GNU_SOURCE
#include <dlfcn.h>
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <time.h>

// Declaración mínima para evitar dependencias de headers de ncurses
typedef struct _win_st WINDOW;

static FILE *logf = NULL;
static void open_log_once(void) {
	if (logf) return;
	logf = fopen("/workspace/work/artifacts/preload.log", "a");
	if (logf) setvbuf(logf, NULL, _IONBF, 0);
}
static void log_time_prefix(void) {
	open_log_once();
	if (!logf) return;
	time_t t = time(NULL);
	struct tm tm;
	localtime_r(&t, &tm);
	char buf[64];
	strftime(buf, sizeof(buf), "%Y-%m-%dT%H:%M:%S", &tm);
	fprintf(logf, "[%s] ", buf);
}

// Hooks para printw/mvprintw/wprintw
int printw(const char *fmt, ...) {
	static int (*real_printw)(const char *, ...) = NULL;
	if (!real_printw) real_printw = dlsym(RTLD_NEXT, "printw");
	va_list ap;
	va_start(ap, fmt);
	char buf[2048];
	vsnprintf(buf, sizeof(buf), fmt, ap);
	va_end(ap);
	log_time_prefix();
	if (logf) fprintf(logf, "printw: %s\n", buf);
	va_start(ap, fmt);
	int ret = real_printw(fmt, ap);
	va_end(ap);
	return ret;
}

int mvprintw(int y, int x, const char *fmt, ...) {
	static int (*real_mvprintw)(int,int,const char *, ...) = NULL;
	if (!real_mvprintw) real_mvprintw = dlsym(RTLD_NEXT, "mvprintw");
	va_list ap;
	va_start(ap, fmt);
	char buf[2048];
	vsnprintf(buf, sizeof(buf), fmt, ap);
	va_end(ap);
	log_time_prefix();
	if (logf) fprintf(logf, "mvprintw(%d,%d): %s\n", y, x, buf);
	va_start(ap, fmt);
	int ret = real_mvprintw(y, x, fmt, ap);
	va_end(ap);
	return ret;
}

int wprintw(WINDOW *win, const char *fmt, ...) {
	static int (*real_wprintw)(WINDOW *, const char *, ...) = NULL;
	if (!real_wprintw) real_wprintw = dlsym(RTLD_NEXT, "wprintw");
	va_list ap;
	va_start(ap, fmt);
	char buf[2048];
	vsnprintf(buf, sizeof(buf), fmt, ap);
	va_end(ap);
	log_time_prefix();
	if (logf) fprintf(logf, "wprintw: %s\n", buf);
	va_start(ap, fmt);
	int ret = real_wprintw(win, fmt, ap);
	va_end(ap);
	return ret;
}

int getch(void) {
	static int (*real_getch)(void) = NULL;
	if (!real_getch) real_getch = dlsym(RTLD_NEXT, "getch");
	int c = real_getch();
	log_time_prefix();
	if (logf) fprintf(logf, "getch -> 0x%02x ('%c')\n", c & 0xff, (c>=32 && c<127)?c:'.');
	return c;
}