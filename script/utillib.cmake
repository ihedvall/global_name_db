# Copyright 2024 Ingemar Hedvall
# SPDX-License-Identifier: MIT

include (FetchContent)
include (CMakePrintHelpers)

cmake_print_variables(COMP_DIR)

FetchContent_Declare(utillib
        GIT_REPOSITORY https://github.com/ihedvall/utillib.git
        GIT_TAG HEAD)

if (GLOBAL_DB_TOOLS)
    set(UTIL_TOOLS ON CACHE BOOL "Do build the executables" FORCE)
else ()
    set(UTIL_TOOLS OFF CACHE BOOL "Do not build the executables" FORCE)
endif()

set(UTIL_DOC OFF CACHE BOOL "Do not build documentation" FORCE)
set(UTIL_TEST OFF CACHE BOOL "Do not build the unit tests" FORCE)
set(UTIL_LEX OFF CACHE BOOL "Do not generate new LEX/BISON code" FORCE)

FetchContent_MakeAvailable(utillib)

cmake_print_variables(utillib_POPULATED utillib_SOURCE_DIR utillib_BINARY_DIR)