# Copyright 2024 Ingemar Hedvall
# SPDX-License-Identifier: MIT

include (CMakePrintHelpers)

if (NOT wxWidgets_FOUND )
    find_package(wxWidgets COMPONENTS adv core base)
endif()

if (NOT wxWidgets_FOUND)
    if (NOT wxWidgets_ROOT_DIR)
        set(wxWidgets_ROOT_DIR ${COMP_DIR}/wxwidgets/master)
    endif()

    if (MINGW)
        set(wxWidgets_LIB_DIR ${COMP_DIR}/wxwidgets/master/lib/gcc_x64_lib)
    endif()

    find_package(wxWidgets COMPONENTS adv core base)
    include(${wxWidgets_USE_FILE})

endif()

cmake_print_variables( wxWidgets_FOUND
        wxWidgets_INCLUDE_DIRS
        wxWidgets_LIBRARY_DIRS
        wxWidgets_LIBRARIES
        wxWidgets_USE_FILE
        wxWidgets_DEFINITIONS
        wxWidgets_DEFINITIONS_DEBUG
        wxWidgets_CXX_FLAGS )



