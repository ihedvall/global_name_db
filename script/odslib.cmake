# Copyright 2024 Ingemar Hedvall
# SPDX-License-Identifier: MIT

include (FetchContent)
include (CMakePrintHelpers)

FetchContent_Declare(odslib
        GIT_REPOSITORY https://github.com/ihedvall/odslib.git
        GIT_TAG HEAD)

if (GLOBAL_DB_TOOLS)
    set(ODS_TOOLS ON CACHE BOOL "Do build the executables" FORCE)
else ()
    set(ODS_TOOLS OFF CACHE BOOL "Do not build the executables" FORCE)
endif()

set(ODS_DOC OFF CACHE BOOL "Do not build documentation" FORCE)
set(ODS_TEST OFF CACHE BOOL "Do not build the unit tests" FORCE)

FetchContent_MakeAvailable(odslib)

cmake_print_variables(odslib_POPULATED odslib_SOURCE_DIR odslib_BINARY_DIR)