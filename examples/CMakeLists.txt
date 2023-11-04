function(add_example name source_files)
    add_executable(${name}
        ${source_files}
    )
    target_link_libraries(${name} PUBLIC
        libaudiofile
    )
endfunction()

add_example(adddcoffset
    adddcoffset.c
)

add_example(power
    power.c
)

if(CMAKE_SYSTEM_NAME MATCHES "Linux")
    add_example(linuxtest
        linuxtest.c
    )
    add_example(alsaplay
        alsaplay.cpp
    )
elseif(CMAKE_SYSTEM_NAME MATCHES "IRIX")
    set(TEST_BIN "irixread irixtestloop")
    add_example(irixread
        irixread.c
        sgi.c
    )
    add_example(irixtestloop
        irixtestloop.c
        sgi.c
    )

    target_include_directories(irixread PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
    )

    target_include_directories(irixtestloop PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
    )
elseif(CMAKE_SYSTEM_NAME MATCHES "Darwin")
    if(EXISTS "/System/Library/Frameworks/CoreAudio.framework")
        add_example(osxplay
            osxplay.c
        )

        find_library(AudioUnit_framework AudioUnit)
        find_library(CoreServices_framework CoreServices)

        target_link_libraries(osxplay PUBLIC
            ${AudioUnit_framework}
            ${CoreServices_framework}
        )
    endif()
endif()