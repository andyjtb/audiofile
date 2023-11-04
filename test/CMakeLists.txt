enable_testing()

set(TESTS
    ADPCM
    AES
    ALAC
    ChannelMatrix
    Error
    FloatToInt
    FormatWithChannels
    Identify
    Instrument
    IntToFloat
    InvalidCompressionFormat
    InvalidSampleFormat
    Large
    Loop
    Marker
    Miscellaneous
    NeXT
    PCMData
    PCMMapping
    Pipe
    Query
    SampleFormat
    Seek
    Sign
    VirtualFile
    floatto24
    query2
    sixteen-to-eight
    testchannelmatrix
    testdouble
    testfloat
    testmarkers
    twentyfour
    twentyfour2
    writealaw
    writeraw
    writeulaw
)

if(ENABLE_FLAC)
    list(APPEND TESTS FLAC)
endif()

function(add_test_executable test is_test)
    set(test_source ${test}.cpp)

    if (NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${test_source})
        set(test_source ${test}.c)
    endif()

    add_executable(${test}
        ${test_source}
        TestUtilities.cpp
    )

    target_link_libraries(${test} PRIVATE
        libaudiofile
        gtest
    )

    target_include_directories(${test} PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
    )

    if(is_test)
        add_test(NAME ${test} COMMAND ${test})
    endif()
endfunction()

foreach(TEST ${TESTS})
    add_test_executable(${TEST} TRUE)
endforeach()

set(check_PROGRAMS
	instparamtest
	instparamwrite
	printmarkers
	testaupv
)

foreach(check_PROGRAM ${check_PROGRAMS})
    add_test_executable(${check_PROGRAM} FALSE)
endforeach()
