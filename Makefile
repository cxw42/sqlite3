# Makefile for cxw42's sqlite3
# This puts the files where soci expects them for a mingw build.

CFLAGS+=-g

REPL=shell.exe

HEADERDIR=include
HEADERFILE=sqlite3.h
HEADERDEST=$(HEADERDIR)/$(HEADERFILE)

LIBDIR=lib
LIBFILE=sqlite3.lib
LIBDEST=$(LIBDIR)/$(LIBFILE)

all: $(HEADERDEST) $(LIBDEST) $(REPL)

$(HEADERDEST): $(HEADERFILE)
	mkdir -p $(HEADERDIR)
	cp $(HEADERFILE) $(HEADERDIR)

$(LIBDEST): sqlite3.o
	mkdir -p $(LIBDIR)
	ar -r $@ $<

$(LIBFILE): 

sqlite3.o: sqlite3.c sqlite3.h
	gcc -c $(CFLAGS) -o $@ $<

$(REPL): sqlite3.c shell.c
	gcc $(CFLAGS) -o $@ $^

clean:
	rm -f sqlite3.o $(HEADERDEST) $(LIBDEST) $(REPL)

