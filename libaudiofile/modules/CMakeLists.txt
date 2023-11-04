add_library(libmodules STATIC
    ALAC.cpp
	ALAC.h
	BlockCodec.cpp
	BlockCodec.h
	FLAC.cpp
	FLAC.h
	FileModule.cpp
	FileModule.h
	G711.cpp
	G711.h
	IMA.cpp
	IMA.h
	Module.cpp
	Module.h
	ModuleState.cpp
	ModuleState.h
	MSADPCM.cpp
	MSADPCM.h
	PCM.cpp
	PCM.h
	RebufferModule.cpp
	RebufferModule.h
	SimpleModule.cpp
	SimpleModule.h
)

target_include_directories(libmodules PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/..
)

target_compile_options(libmodules PRIVATE
    -Wall
    -Wno-multichar
    -fvisibility=hidden
    -fno-rtti
    -fno-exceptions
    -fvisibility-inlines-hidden
)

if (ENABLE_FLAC)
    target_link_libraries(libmodules PUBLIC
        FLAC::FLAC
    )
endif()
