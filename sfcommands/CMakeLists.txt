function(add_sfcommand name)
    add_executable(${name}
        ${name}.c
        printinfo.c
        printinfo.h
    )
    target_link_libraries(${name} PUBLIC
        libaudiofile
    )
    target_include_directories(${name} PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
    )
endfunction()

add_sfcommand(sfconvert)
add_sfcommand(sfinfo)
