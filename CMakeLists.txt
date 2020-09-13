
cmake_minimum_required(VERSION 2.8)

project(flow_sensor)

include(CheckSymbolExists)
function(detect_architecture symbol arch)
    if (NOT DEFINED ARCHITECTURE OR ARCHITECTURE STREQUAL "")
        set(CMAKE_REQUIRED_QUIET 1)
        check_symbol_exists("${symbol}" "" ARCHITECTURE_${arch})
        unset(CMAKE_REQUIRED_QUIET)

        # The output variable needs to be unique across invocations otherwise
        # CMake's crazy scope rules will keep it defined
        if (ARCHITECTURE_${arch})
            set(ARCHITECTURE "${arch}" PARENT_SCOPE)
            set(ARCHITECTURE_${arch} 1 PARENT_SCOPE)
            add_definitions(-DARCHITECTURE_${arch}=1)
        endif()
    endif()
endfunction()
if (MSVC)
    detect_architecture("_M_AMD64" x86_64)
    detect_architecture("_M_IX86" x86)
    detect_architecture("_M_ARM" ARM)
else()
    detect_architecture("__x86_64__" x86_64)
    detect_architecture("__i386__" x86)
    detect_architecture("__arm__" ARM)
endif()
if (NOT DEFINED ARCHITECTURE OR ARCHITECTURE STREQUAL "")
    set(ARCHITECTURE "GENERIC")
endif()
message(STATUS "Hermes Base Module: ${ARCHITECTURE}")
message(STATUS "Taret platform: ${PLATFORM_NAME}")

if (NOT DEFINED PLATFORM_NAME OR PLATFORM_NAME STREQUAL "")
    set(PLATFORM_NAME "x86_64")
endif()

if (DEFINED EXTRA_CXX_FLAGS AND NOT EXTRA_CXX_FLAGS STREQUAL "")
    set(CMAKE_CXX_FLAGS "${EXTRA_CXX_FLAGS} ${CMAKE_CXX_FLAGS}")
endif()

set(CMAKE_C_FLAGS "-fPIC ${CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS "-fPIC ${CMAKE_CXX_FLAGS}")
set(CMAKE_CXX_FLAGS "--std=c++11 ${CMAKE_CXX_FLAGS}")


include_directories(
    ${CMAKE_SOURCE_DIR}/inc 
    ${CMAKE_SOURCE_DIR}/deps/hermes-base-cpp/build/install/${PLATFORM_NAME}/include
    ${CMAKE_SOURCE_DIR}/deps/hermes-base-cpp/test/gtest/include
    ${CMAKE_SOURCE_DIR}/deps/hermes-base-cpp/deps/plog/include
)

link_directories(
    ${CMAKE_SOURCE_DIR}/deps/hermes-base-cpp/build/install/${PLATFORM_NAME}/lib
    ${CMAKE_SOURCE_DIR}/deps/hermes-base-cpp/test/gtest/lib
)

set(APP_SOURCE 
    #ADD YOUR SOURCE FILES HERE
    ${CMAKE_SOURCE_DIR}/src/FlowSensor.cpp
    ${CMAKE_SOURCE_DIR}/src/flow_velocity.cpp
)

add_library(${PROJECT_NAME} SHARED ${APP_SOURCE})

install(FILES ${CMAKE_SOURCE_DIR}/module.json DESTINATION ${CMAKE_SOURCE_DIR}/build/target/${PLATFORM_NAME}/docker)
install(FILES ${CMAKE_SOURCE_DIR}/module.json DESTINATION ${CMAKE_SOURCE_DIR}/deps/hermes-base-cpp)

install(TARGETS ${PROJECT_NAME}  DESTINATION ${CMAKE_SOURCE_DIR}/build/target/${PLATFORM_NAME}/docker/lib)
install(TARGETS ${PROJECT_NAME}  DESTINATION ${CMAKE_SOURCE_DIR}/deps/hermes-base-cpp/build/install/${PLATFORM_NAME}/lib/)

if (test)
    ENABLE_TESTING()
    add_subdirectory(tests)
endif()
