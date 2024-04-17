#include "unity_fixture.h"

void runAllTests(void)
{
    RUN_TEST_GROUP(my_math);
}

TEST_GROUP_RUNNER(my_math)
{
    RUN_TEST_CASE(my_math, add);
    RUN_TEST_CASE(my_math, sub);
}