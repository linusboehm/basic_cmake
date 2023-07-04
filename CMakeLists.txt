# 3.24.1 required to fix warning for gtest download
cmake_minimum_required(VERSION 3.24.1)
project(toy_project)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY
    ${CMAKE_BINARY_DIR}/bin
    CACHE INTERNAL "")

string(
    CONCAT DEFAULT_BUILD_FLAGS
         "-g "
         # do not ignore warnings
         "-Werror "
         # enable more warnings
         "-Wall "
         "-Wextra "
         "-Wshadow "
         "-Wconversion "
         "-Wpedantic ")

# default to release build
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE
      Release
      CACHE INTERNAL "")
endif()

if(${CMAKE_BUILD_TYPE} STREQUAL "Release")
  add_definitions(-DNDEBUG)
  set_property(
    DIRECTORY ${CMAKE_SOURCE_DIR}
    APPEND
    PROPERTY COMPILE_DEFINITIONS NDEBUG)
endif()

set(CMAKE_CXX_FLAGS
    ${DEFAULT_BUILD_FLAGS}
    CACHE INTERNAL "")
set(CMAKE_CXX_FLAGS_RELEASE
    "-O3"
    CACHE INTERNAL "")
set(CMAKE_CXX_FLAGS_DEBUG
    "-O1 -fsanitize=address -fno-omit-frame-pointer "
    CACHE INTERNAL "")

message("BUILD TYPE: ${CMAKE_BUILD_TYPE}")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/ec4fed93217bc2830959bb8e86798c1d86956949.zip
)
FetchContent_MakeAvailable(googletest)

include_directories(src)
add_subdirectory(src)
