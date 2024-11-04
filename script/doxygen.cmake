# Copyright 2024 Ingemar Hedvall
# SPDX-License-Identifier: MIT

include (CMakePrintHelpers)

if (NOT DOXYGEN_FOUND)
    find_package(Doxygen COMPONENTS dot mscgen dia)

endif()

cmake_print_variables(DOXYGEN_FOUND DOXYGEN_VERSION)
