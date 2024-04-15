# This file contains core defines.
# User should provide:
# LINKER_SCRIPT := path to linker script file
# TARGET_BINARY := path to binary file without extension

# Compiler and flags
CC = arm-none-eabi-gcc

OPT = -g -gdwarf-2
CPU = -mthumb -mcpu=cortex-m7 -mfloat-abi=softfp -mfpu=fpv5-d16
CFLAGS = $(CPU) $(OPT) -DSTM32F767xx
ASFLAGS = $(CPU) $(OPT)
LDFLAGS = -specs=nosys.specs -T$(LINKER_SCRIPT) -Wl,-Map,$(TARGET_BINARY).map,--no-warn-rwx-segment $(CPU) $(OPT)