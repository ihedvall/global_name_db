# Copyright 2024 Ingemar Hedvall
# SPDX-License-Identifier: MIT

include (FetchContent)
include (CMakePrintHelpers)

FetchContent_Declare(workflowlib
        GIT_REPOSITORY https://github.com/ihedvall/workflowlib.git
        GIT_TAG HEAD)

if (GLOBAL_DB_TOOLS)
    set(WORKFLOW_TOOLS ON CACHE BOOL "Do build the executables" FORCE)
else ()
    set(WORKFLOW_TOOLS OFF CACHE BOOL "Do not build the executables" FORCE)
endif()

set(WORKFLOW_DOC OFF CACHE BOOL "Do not build documentation" FORCE)
set(WORKFLOW_TEST OFF CACHE BOOL "Do not build the unit tests" FORCE)

FetchContent_MakeAvailable(workflowlib)

cmake_print_variables(workflowlib_POPULATED workflowlib_SOURCE_DIR workflowlib_BINARY_DIR)
