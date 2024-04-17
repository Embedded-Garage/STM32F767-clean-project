TARGET=my_math_test

# Source files
SRC_FILES = \
../../src/my_math.c

SYS_FILES = \
../../src/sys/startup_stm32f767xx.s \
../../src/sys/syscalls.c

COMMON_FILES = \
../common/unity_runner.c \
../common/unity.c \
../common/unity_fixture.c

TEST_FILES = \
test_runner.c \
my_math_test.c

# Include paths
INC := \
-I../common \
-I../../src \
-I../../src/sys/CMSIS

include ../common/common.mk
