OUT_DIR = out

LINKER_SCRIPT := sys/STM32F767ZITx_FLASH.ld
TARGET_BINARY := $(OUT_DIR)/main

include sys/sys.mk

SRCS = \
sys/syscalls.c \
main.c \
sys/startup_stm32f767xx.s

OBJS := $(SRCS:%=$(OUT_DIR)/%.o)

all: $(TARGET_BINARY).bin $(TARGET_BINARY).hex

$(TARGET_BINARY).bin: $(TARGET_BINARY).elf
	@ mkdir -p $(dir $@)
	arm-none-eabi-objcopy -O binary $< $@

$(TARGET_BINARY).hex: $(TARGET_BINARY).elf
	@ mkdir -p $(dir $@)
	arm-none-eabi-objcopy -O ihex $< $@

$(TARGET_BINARY).elf: $(OBJS)
	@ mkdir -p $(dir $@)
	$(CC) $(LDFLAGS) $^ -o $@

$(OUT_DIR)/%.c.o: %.c
	@ mkdir -p $(dir $@)
	$(CC) -c $(CFLAGS) $< -o $@

$(OUT_DIR)/%.s.o: %.s
	@ mkdir -p $(dir $@)
	$(CC) -c $(ASFLAGS) $< -o $@

clean:
	rm -rf $(OUT_DIR)