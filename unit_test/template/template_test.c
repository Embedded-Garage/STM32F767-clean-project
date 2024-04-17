#include "unity_fixture.h"

TEST_GROUP(template);

TEST_SETUP(template) {}

TEST_TEAR_DOWN(template) {}

TEST(template, pass)
{
    TEST_ASSERT(1);
}

TEST(template, fail)
{
    TEST_ASSERT_MESSAGE(0, "Template test fail intentionally");
}
