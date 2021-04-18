DJGPP=/home/ilu/djgpp/bin

CROSS=$(DJGPP)/i586-pc-msdosdjgpp
CROSS_PLATFORM=i586-pc-msdosdjgpp-
CC=$(DJGPP)/$(CROSS_PLATFORM)gcc
AR=$(DJGPP)/$(CROSS_PLATFORM)ar
LD=$(DJGPP)/$(CROSS_PLATFORM)ld
STRIP=$(DJGPP)/$(CROSS_PLATFORM)strip
RANLIB=$(DJGPP)/$(CROSS_PLATFORM)ranlib

CFLAGS	= -MMD -Wall -std=gnu99 -O2 -march=i386 -mtune=i586 -ffast-math -fomit-frame-pointer -fgnu89-inline -Wmissing-prototypes \
	-DSQLITE_THREADSAFE=0 \
	-DSQLITE_DEFAULT_MEMSTATUS=0 \
	-DSQLITE_MAX_MMAP_SIZE=0 \
	-DSQLITE_OMIT_WAL=1 \
	-DSQLITE_OMIT_LOAD_EXTENSION=1 \
	-DSQLITE_ENABLE_8_3_NAMES=2 \
	-DSQLITE_ENABLE_LOCKING_STYLE=0
LIBS    = -lm -lemu
LDFLAGS =
EXE     = sqlite.exe
PARTS   = sqlite3.o shell.o

%.o: %.c
	$(CC) -o $@ -c $(CFLAGS) $<

$(EXE): $(PARTS)
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
	$(STRIP) $@

clean:
	rm -rf *.o *.d $(EXE)
