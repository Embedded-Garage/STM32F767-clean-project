CC=arm-none-eabi-gcc
CFLAGS=
LDFLAGS= -specs=nosys.specs

all: main.bin

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

main.bin: main.o
	$(CC) $(LDFLAGS) main.o -o main.elf
	arm-none-eabi-objcopy -O binary main.elf main.bin

clean:
	rm -f *.o *.elf *.bin
