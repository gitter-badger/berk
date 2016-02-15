find_package(PkgConfig)
pkg_check_modules(GTK REQUIRED gtk+-3.0)
pkg_check_modules(VTE REQUIRED vte-2.91)
add_definitions(${GTK_CFLAGS} ${GTK_CFLAGS_OTHER} ${VTE_CFLAGS} ${VTE_CFLAGS_OTHER})
link_libraries(${GTK_LIBRARIES} ${VTE_LIBRARIES})
link_directories(${GTK_LIBRARY_DIRS} ${VTE_LIBRARIES})

set(VALA_SRC
    main.vala
    Berk/Application.vala
    Berk/Window.vala
)

vala_precompile(
    VALA_C ${VALA_SRC}
    PACKAGES gtk+-3.0 vte-2.91
    OPTIONS --thread
)

add_executable(berk
    ${VALA_C}
)
