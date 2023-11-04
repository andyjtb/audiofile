# Taken from SFML
# Find the native FLAC includes and libraries
#
#  FLAC_INCLUDE_DIRS - where to find FLAC headers.
#  FLAC_LIBRARIES    - List of libraries when using libFLAC.
#  FLAC_FOUND        - True if libFLAC found.
#  FLAC_DEFINITIONS  - FLAC compile definitions

find_path(FLAC_INCLUDE_DIR FLAC/all.h)
find_path(FLAC_INCLUDE_DIR FLAC/stream_decoder.h)

find_library(FLAC_LIBRARY NAMES FLAC)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(FLAC DEFAULT_MSG FLAC_LIBRARY FLAC_INCLUDE_DIR)

mark_as_advanced(FLAC_INCLUDE_DIR FLAC_LIBRARY)

add_library(FLAC::FLAC IMPORTED UNKNOWN)
target_include_directories(FLAC::FLAC INTERFACE ${FLAC_INCLUDE_DIR})

if(FLAC_LIBRARY MATCHES "/([^/]+)\\.framework$")
    set_target_properties(FLAC::FLAC PROPERTIES IMPORTED_LOCATION ${FLAC_LIBRARY}/${CMAKE_MATCH_1})
else()
    set_target_properties(FLAC::FLAC PROPERTIES IMPORTED_LOCATION ${FLAC_LIBRARY})
endif()
