add_library(libalac STATIC
	ag_dec.c
	ag_enc.c
	aglib.h
	ALACAudioTypes.h
	ALACBitUtilities.c
	ALACBitUtilities.h
	ALACDecoder.cpp
	ALACDecoder.h
	ALACEncoder.cpp
	ALACEncoder.h
	dp_dec.c
	dp_enc.c
	dplib.h
	EndianPortable.c
	EndianPortable.h
	matrix_dec.c
	matrix_enc.c
	matrixlib.h
)

target_include_directories(libalac PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_options(libalac PRIVATE
    -Wall
    -Wno-multichar
    -fvisibility=hidden
    -fno-rtti
    -fno-exceptions
    -fvisibility-inlines-hidden
)