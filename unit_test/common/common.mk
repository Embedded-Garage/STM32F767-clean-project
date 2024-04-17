LINKER_SCRIPT := ../../src/sys/STM32F767ZITx_FLASH.ld

UNITY_FLAGS = -DUNITY_INCLUDE_CONFIG_H -DUNITY_FIXTURE_NO_EXTRAS

# Directories
SRC_DIR = ../../src
SYS_DIR = ../../src/sys
COMMON_DIR = ../common
OUT_DIR = out

OUT_SRC_DIR = $(OUT_DIR)/src
OUT_SYS_DIR = $(OUT_DIR)/sys
OUT_COMMON_DIR = $(OUT_DIR)/common
OUT_TEST_DIR = $(OUT_DIR)/test

TARGET_BINARY := $(OUT_DIR)/$(TARGET)

include ../../src/sys/sys.mk

# Object files
SRC_OBJS := $(patsubst $(SRC_DIR)/%,$(OUT_SRC_DIR)/%.o,$(SRC_FILES))
SYS_OBJS := $(patsubst $(SYS_DIR)/%,$(OUT_SYS_DIR)/%.o,$(SYS_FILES))
COMMON_OBJS := $(patsubst $(COMMON_DIR)/%,$(OUT_COMMON_DIR)/%.o,$(COMMON_FILES))
TEST_OBJS := $(patsubst %,$(OUT_TEST_DIR)/%.o,$(TEST_FILES))

OBJS := $(SRC_OBJS) $(SYS_OBJS) $(COMMON_OBJS) $(TEST_OBJS)

all:  $(TARGET_BINARY).bin

$(TARGET_BINARY).bin: $(TARGET_BINARY).elf
	@ mkdir -p $(dir $@)
	arm-none-eabi-objcopy -O binary $< $@

$(TARGET_BINARY).elf: $(OBJS)
	@ mkdir -p $(dir $@)
	$(CC) $(LDFLAGS) $^ -o $@

$(OUT_SRC_DIR)/%.c.o: $(SRC_DIR)/%.c
	@ mkdir -p $(dir $@)
	$(CC) -c $(CFLAGS) $(INC) -o $@ $<

$(OUT_SRC_DIR)/%.s.o: $(SRC_DIR)/%.s
	@ mkdir -p $(dir $@)
	$(CC) -c $(ASFLAGS) $(INC) -o $@ $<

$(OUT_SYS_DIR)/%.c.o: $(SYS_DIR)/%.c
	@ mkdir -p $(dir $@)
	$(CC) -c $(CFLAGS) $(INC) -o $@ $<

$(OUT_SYS_DIR)/%.s.o: $(SYS_DIR)/%.s
	@ mkdir -p $(dir $@)
	$(CC) -c $(ASFLAGS) $(INC) -o $@ $<

$(OUT_COMMON_DIR)/%.c.o: $(COMMON_DIR)/%.c
	@ mkdir -p $(dir $@)
	$(CC) -c $(CFLAGS) $(UNITY_FLAGS) $(INC) -o $@ $<

$(OUT_COMMON_DIR)/%.s.o: $(COMMON_DIR)/%.s
	@ mkdir -p $(dir $@)
	$(CC) -c $(ASFLAGS) $(UNITY_FLAGS) $(INC) -o $@ $<

$(OUT_TEST_DIR)/%.c.o: %.c
	@ mkdir -p $(dir $@)
	$(CC) -c $(CFLAGS) $(UNITY_FLAGS) $(INC) -o $@ $<

$(OUT_TEST_DIR)/%.s.o: %.s
	@ mkdir -p $(dir $@)
	$(CC) -c $(ASFLAGS) $(UNITY_FLAGS) $(INC) -o $@ $<

clean:
	rm -rf $(OUT_DIR)

# Targets
.PHONY: all clean
