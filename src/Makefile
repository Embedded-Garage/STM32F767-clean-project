CPU = -mthumb -mcpu=cortex-m7 -mfloat-abi=softfp -mfpu=fpv5-d16
OPT = -g -gdwarf-2

CFLAGS=  $(CPU) $(OPT)
ASFLAGS = $(CPU) $(OPT)
LDFLAGS= -specs=nosys.specs -TSTM32F767ZITx_FLASH.ld -Wl,-Map=main.map,--cref $(CPU) $(OPT)

CC=arm-none-eabi-gcc

ifdef OS
   RM = del /Q
   FixPath = $(subst /,\,$1)
else
   ifeq ($(shell uname), Linux)
      RM = rm -f
      FixPath = $1
   endif
endif

all: main.bin

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

%.o: %.s
	$(CC) -c $(ASFLAGS) $< -o $@

main.bin: main.o syscalls.o startup_stm32f767xx.o
	$(CC) $(LDFLAGS) main.o syscalls.o startup_stm32f767xx.o -o main.elf
	arm-none-eabi-objcopy -O binary main.elf main.bin

clean:
	$(RM) $(call FixPath,*.o *.elf *.bin)