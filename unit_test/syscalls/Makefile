# Compiler and flags
CPU = -mthumb -mcpu=cortex-m7 -mfloat-abi=softfp -mfpu=fpv5-d16
OPT = -g -gdwarf-2
CFLAGS = $(CPU) $(OPT)
ASFLAGS = $(CPU) $(OPT)
LDFLAGS = -specs=nosys.specs -TSTM32F767ZITx_FLASH.ld -Wl,-Map,main.map,--cref $(CPU) $(OPT)
CC = arm-none-eabi-gcc

# Directories
SRC_DIR = ../src
UNITY_DIR = unity
OUT_DIR = out

# Source files
SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
UNITY_FILES = $(wildcard $(UNITY_DIR)/*.c)
TEST_FILES = test_runner.c syscalls_test.c

# Object files
SRC_OBJS = $(patsubst $(SRC_DIR)/%.c,$(OUT_DIR)/%.o,$(SRC_FILES))
UNITY_OBJS = $(patsubst $(UNITY_DIR)/%.c,$(OUT_DIR)/%.o,$(UNITY_FILES))
TEST_OBJS = $(patsubst %.c,$(OUT_DIR)/%.o,$(TEST_FILES))

# Targets
.PHONY: all clean

all: $(OUT_DIR)/syscalls_test.bin

$(OUT_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) -c $(CFLAGS) $< -o $@

$(OUT_DIR)/%.o: $(UNITY_DIR)/%.c
	$(CC) -c $(CFLAGS) $< -o
    $@

$(OUT_DIR)/%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

$(OUT_DIR)/syscalls_test.bin: $(SRC_OBJS) $(UNITY_OBJS) $(TEST_OBJS)
	$(CC) $(LDFLAGS) $^ -o $@
	arm-none-eabi-objcopy -O binary $@ $(OUT_DIR)/syscalls_test.bin

clean:
	rm -rf $(OUT_DIR)

# Ensure the output directory exists
$(shell mkdir $(OUT_DIR))
