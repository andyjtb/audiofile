add_library(gtest STATIC
    gtest.h
    gtest-all.cc
)

target_include_directories(gtest PUBLIC
    ${PROJECT_SOURCE_DIR}
)

target_compile_options(gtest PUBLIC
    -fno-rtti -fno-exceptions -DGTEST_HAS_RTTI=0 -DGTEST_HAS_EXCEPTIONS=0
)
target_link_libraries(gtest PUBLIC
    pthread
)
