# Copyright 2024 Ingemar Hedvall
# SPDX-License-Identifier: MIT

cmake_minimum_required(VERSION 3.20)
project(global_name_db
        VERSION 1.0
        DESCRIPTION "Common Names Database."
        LANGUAGES CXX)

option(BUILD_SHARED_LIBS "Static libraries are preferred" OFF)
option(GLOBAL_DB_DOC "Build documentation in Release mode" OFF)
option(GLOBAL_DB_TOOLS "Build GUI and executables" OFF)
option(GLOBAL_DB_TEST "Build Google Unit Tests" OFF)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_DEBUG_POSTFIX d)

include ("script/utillib.cmake")
include ("script/workflowlib.cmake")
include ("script/odslib.cmake")

if (GLOBAL_DB_TOOLS)
    include("script/wxwidgets.cmake")
endif()

if (GLOBAL_DB_TEST)
    include("script/googletest.cmake")
endif()

if (GLOBAL_DB_DOC)
    include("script/doxygen.cmake")
endif()

add_library(global_db
        src/global_db.cpp  include/global_db/global_db.h
)


target_include_directories(global_db PRIVATE ${Boost_INCLUDE_DIRS})
target_include_directories(global_db PRIVATE ${utillib_SOURCE_DIR}/include)
target_include_directories(global_db PRIVATE ${workflowlib_SOURCE_DIR}/include)
target_include_directories(global_db PRIVATE ${odslib_SOURCE_DIR}/include)
target_include_directories(global_db PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src)


target_include_directories(global_db PUBLIC
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        )

target_compile_definitions(global_db PRIVATE XML_STATIC)

set(GLOBAL_DB_PUBLIC_HEADERS include/global_db/global_db.h)

set_target_properties(global_db PROPERTIES PUBLIC_HEADER "${GLOBAL_DB_PUBLIC_HEADERS}")

install(TARGETS global_db
        EXPORT GlobalDBTargets
        LIBRARY DESTINATION global_db/lib
        ARCHIVE DESTINATION global_db/lib
        RUNTIME DESTINATION global_db/bin
        PUBLIC_HEADER DESTINATION global_db/include/global_db)

if (wxWidgets_FOUND AND GLOBAL_DB_TOOLS)
#    add_subdirectory(odsconfigurator)
#    add_subdirectory(reportexplorer)
endif()

if (GLOBAL_DB_TEST)
    enable_testing()
    add_subdirectory(test)
endif()

if (DOXYGEN_FOUND AND GLOBAL_DB_DOC AND (CMAKE_BUILD_TYPE MATCHES "^[Rr]elease") )
    #set(DOXYGEN_RECURSIVE YES)
    set(DOXYGEN_RECURSIVE NO)
    set(DOXYGEN_REPEAT_BRIEF NO)
    set(DOXYGEN_PROJECT_NAME "GlobalDB")
    # set(DOXYGEN_HTML_EXTRA_STYLESHEET doxygen/utillib.css)
    # set(DOXYGEN_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/docs/manual)
    doxygen_add_docs(doc_globaldb ALL
            include/globaldb
            COMMENT "Global DB library generating API documentation with Doxygen")
endif()