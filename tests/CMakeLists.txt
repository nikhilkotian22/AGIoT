cmake_minimum_required(VERSION 2.8)

project(flow_sensorTest)

set(CMAKE_CXX_FLAGS "-ftest-coverage -fprofile-arcs -fprofile-generate  ${CMAKE_CXX_FLAGS}")

SET(CMAKE_EXE_LINKER_FLAGS  "${CMAKE_EXE_LINKER_FLAGS} -Wl,--whole-archive -lhbm_stub -Wl,--no-whole-archive" )

set (APPLICATION_SOURCE
    ${CMAKE_SOURCE_DIR}/src/FlowSensor.cpp
    ${CMAKE_SOURCE_DIR}/src/flow_velocity.cpp
)

set(UNITTEST_SOURCE 
    FlowSensorTest.cpp
)

add_executable(${PROJECT_NAME}  ${UNITTEST_SOURCE} ${APPLICATION_SOURCE})

target_link_libraries(${PROJECT_NAME} 
    gtestd 
    gtest_maind 
    pthread
    curl
    dl
)   
