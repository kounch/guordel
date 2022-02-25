CC=zcc
AS=zcc
TARGET=+zx
VERBOSITY=-vn
CRT=5

PRAGMA_FILE=zpragma.inc

C_OPT_FLAGS=--std-c11 --opt-code-size -SO3 --max-allocs-per-node200000

CFLAGS=$(TARGET) $(VERBOSITY) -c $(C_OPT_FLAGS) -compiler sdcc -clib=sdcc_iy -pragma-include:$(PRAGMA_FILE)
LDFLAGS=$(TARGET) $(VERBOSITY) -clib=sdcc_iy -pragma-include:$(PRAGMA_FILE)
ASFLAGS=$(TARGET) $(VERBOSITY) -c

EXEC=build/guordel

OBJECTS = build/guordel.o

build/%.o: %.c $(PRAGMA_FILE)
	$(CC) $(CFLAGS) -o $@ $<

build/%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $<

all : $(EXEC)

$(EXEC) : $(OBJECTS)
	$(CC) $(LDFLAGS) -startup=$(CRT) $(OBJECTS) -o $(EXEC) -create-app

.PHONY: clean
clean:
	rm -f build/*.o build/*.bin build/*.tap build/*.map build/zcc_opt.def *~ /tmp/tmpXX* build/*.tap build/*.nex build/*.bin build/*.bas
