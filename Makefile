CC=arm-none-eabi-gcc
CFLAGS=
ASFLAGS =
LDFLAGS= -specs=nosys.specs -TSTM32F767ZITx_FLASH.ld

all: main.bin

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

%.o: %.s
	$(CC) -c $(ASFLAGS) $< -o $@

main.bin: main.o syscalls.o startup_stm32f767xx.o
	$(CC) $(LDFLAGS) main.o syscalls.o startup_stm32f767xx.o -o main.elf
	arm-none-eabi-objcopy -O binary main.elf main.bin

clean:
	rm -f *.o *.elf *.bin
