enable_testing()

add_executable(some_test test_some.cpp)
target_link_libraries(some_test GTest::gtest_main)

include(GoogleTest)
gtest_discover_tests(some_test)
