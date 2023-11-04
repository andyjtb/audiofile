add_library(libaudiofile STATIC
    AIFF.cpp
    AIFF.h
    AVR.cpp
    AVR.h
    AudioFormat.cpp
    AudioFormat.h
    Buffer.cpp
    Buffer.h
    CAF.cpp
    CAF.h
    Compiler.h
    FLACFile.cpp
    FLACFile.h
    Features.h
    File.cpp
    File.h
    FileHandle.cpp
    FileHandle.h
    IFF.cpp
    IFF.h
    IRCAM.cpp
    IRCAM.h
    Instrument.cpp
    Instrument.h
    Loop.cpp
    Marker.cpp
    Marker.h
    Miscellaneous.cpp
    NIST.cpp
    NIST.h
    NeXT.cpp
    NeXT.h
    PacketTable.cpp
    PacketTable.h
    Raw.cpp
    Raw.h
    SampleVision.cpp
    SampleVision.h
    Setup.cpp
    Setup.h
    Shared.h
    Tag.h
    Track.cpp
    Track.h
    UUID.cpp
    UUID.h
    VOC.cpp
    VOC.h
    WAVE.cpp
    WAVE.h
    aes.cpp
    af_vfs.cpp
    af_vfs.h
    afinternal.h
    aupv.c
    aupvinternal.h
    aupvlist.h
    byteorder.h
    byteorder.h
    compression.cpp
    compression.h
    data.cpp
    debug.cpp
    debug.h
    error.c
    error.h
    extended.c
    extended.h
    format.cpp
    g711.c
    g711.h
    openclose.cpp
    pcm.cpp
    pcm.h
    query.cpp
    units.cpp
    units.h
    util.cpp
    util.h
)

target_include_directories(libaudiofile PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_options(libaudiofile PRIVATE
    -Wall
    -fno-rtti
    -fno-exceptions
    -fvisibility-inlines-hidden
)

add_subdirectory(alac)
add_subdirectory(modules)

target_link_libraries(libaudiofile PUBLIC
    libalac
    libmodules
    m
)

target_link_options(libaudiofile PRIVATE
    -version-info ${AUDIOFILE_VERSION_INFO}
    -no-undefined
    -export-symbols ${CMAKE_CURRENT_SOURCE_DIR}/audiofile.exports
)

if (ENABLE_VALGRIND)
#    VALGRIND_FLAGS = --quiet --leak-check=full --show-reachable=yes --error-exitcode=1
#    TESTS_ENVIRONMENT = $(top_builddir)/libtool --mode=execute $(VALGRIND) $(VALGRIND_FLAGS)
endif()

if (ENABLE_TESTS)
    add_executable(UnitTests
		modules/UT_RebufferModule.cpp
	)

    target_include_directories(UnitTests PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
    )

    target_compile_options(UnitTests PUBLIC
		-fno-rtti
        -fno-exceptions
        -DGTEST_HAS_RTTI=0
        -DGTEST_HAS_EXCEPTIONS=0
	)

    target_link_libraries(UnitTests PUBLIC
		libaudiofile
		gtest
	)

	add_test(NAME UnitTests COMMAND UnitTests)
endif()
