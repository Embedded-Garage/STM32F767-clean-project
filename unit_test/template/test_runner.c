#include "unity_fixture.h"

void runAllTests(void)
{
    RUN_TEST_GROUP(template);
}

TEST_GROUP_RUNNER(template)
{
    RUN_TEST_CASE(template, pass);
    RUN_TEST_CASE(template, fail);
}
