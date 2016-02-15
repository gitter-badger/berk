cmake_minimum_required(VERSION 3.0.0)

project(berk C)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/target)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake/vala/vala)

include(FindVala)
include(UseVala)

find_package(Vala REQUIRED 0.30.0 MINIMUM)

add_subdirectory(src)
