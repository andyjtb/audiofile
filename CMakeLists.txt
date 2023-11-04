cmake_minimum_required(VERSION 3.25)

project(audiofile VERSION 0.3.6)
set(AUDIOFILE_VERSION_INFO 1:0:0)

option(ENABLE_COVERAGE "Enable code coverage" OFF)
option(ENABLE_DOCUMENTATION "Disable documentation" OFF)
option(ENABLE_EXAMPLES "Build examples" ON)
option(ENABLE_FLAC "Whether FLAC is enabled" ON)
option(ENABLE_SFCOMMANDS "Build sfcommands" ON)
option(ENABLE_TESTS "Build tests" ON)
option(ENABLE_VALGRIND "Enable testing with Valgrind" OFF)
option(ENABLE_WERROR "Treat compiler warnings as errors" OFF)

if (ENABLE_WERROR)
    add_compile_options(-Werror)
endif ()

if (ENABLE_COVERAGE)
    message(FATAL_ERROR Not currently configured)

    # Roughly this, but not tested
    find_program(LCOV lcov REQUIRED)
    find_program(GENHTML genhtml)

    add_compile_options(-fprofile-arcs -ftest-coverage)
    link_libraries(gcov)
endif()

if (ENABLE_DOCUMENTATION)
    add_subdirectory(docs)
endif()

if (ENABLE_VALGRIND)
    message(FATAL_ERROR Not currently configured)
    # Roughly this, but not tested
    find_program(VALGRIND valgrind REQUIRED)
endif()

if (ENABLE_FLAC)
    include(FindFlac.cmake)
endif()

include (GenerateConfig.cmake)

if (ENABLE_TESTS)
    add_subdirectory(gtest)
    enable_testing()
endif ()

add_subdirectory(libaudiofile)

if (ENABLE_SFCOMMANDS)
    add_subdirectory(sfcommands)
endif()

if (ENABLE_EXAMPLES)
    add_subdirectory(examples)
endif()

if (ENABLE_TESTS)
    add_subdirectory(test)
endif ()
