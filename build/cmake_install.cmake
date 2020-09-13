# Install script for directory: /workspace/hbm-vscode-remote

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/workspace/hbm-vscode-remote/build/target/x86_64/docker/module.json")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/workspace/hbm-vscode-remote/build/target/x86_64/docker" TYPE FILE FILES "/workspace/hbm-vscode-remote/module.json")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/workspace/hbm-vscode-remote/deps/hermes-base-cpp/module.json")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/workspace/hbm-vscode-remote/deps/hermes-base-cpp" TYPE FILE FILES "/workspace/hbm-vscode-remote/module.json")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}/workspace/hbm-vscode-remote/build/target/x86_64/docker/lib/libflow_sensor.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/workspace/hbm-vscode-remote/build/target/x86_64/docker/lib/libflow_sensor.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/workspace/hbm-vscode-remote/build/target/x86_64/docker/lib/libflow_sensor.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/workspace/hbm-vscode-remote/build/target/x86_64/docker/lib/libflow_sensor.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/workspace/hbm-vscode-remote/build/target/x86_64/docker/lib" TYPE SHARED_LIBRARY FILES "/workspace/hbm-vscode-remote/build/libflow_sensor.so")
  if(EXISTS "$ENV{DESTDIR}/workspace/hbm-vscode-remote/build/target/x86_64/docker/lib/libflow_sensor.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/workspace/hbm-vscode-remote/build/target/x86_64/docker/lib/libflow_sensor.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/workspace/hbm-vscode-remote/build/target/x86_64/docker/lib/libflow_sensor.so")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}/workspace/hbm-vscode-remote/deps/hermes-base-cpp/build/install/x86_64/lib/libflow_sensor.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/workspace/hbm-vscode-remote/deps/hermes-base-cpp/build/install/x86_64/lib/libflow_sensor.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/workspace/hbm-vscode-remote/deps/hermes-base-cpp/build/install/x86_64/lib/libflow_sensor.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/workspace/hbm-vscode-remote/deps/hermes-base-cpp/build/install/x86_64/lib/libflow_sensor.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/workspace/hbm-vscode-remote/deps/hermes-base-cpp/build/install/x86_64/lib" TYPE SHARED_LIBRARY FILES "/workspace/hbm-vscode-remote/build/libflow_sensor.so")
  if(EXISTS "$ENV{DESTDIR}/workspace/hbm-vscode-remote/deps/hermes-base-cpp/build/install/x86_64/lib/libflow_sensor.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/workspace/hbm-vscode-remote/deps/hermes-base-cpp/build/install/x86_64/lib/libflow_sensor.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/workspace/hbm-vscode-remote/deps/hermes-base-cpp/build/install/x86_64/lib/libflow_sensor.so")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/workspace/hbm-vscode-remote/build/tests/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/workspace/hbm-vscode-remote/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
