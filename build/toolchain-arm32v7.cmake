#```cmake
INCLUDE(CMakeForceCompiler)

SET(CMAKE_SYSTEM_NAME Linux)     # this one is important
SET(CMAKE_SYSTEM_VERSION 1)     # this one not so much

# this is the location of the arm toolchain targeting the arm32v7
SET(CMAKE_C_COMPILER $ENV{ARM_ROOT}/../bin/arm-linux-gnueabihf-gcc)
SET(CMAKE_CXX_COMPILER $ENV{ARM_ROOT}/../bin/arm-linux-gnueabihf-g++)

# this is the file system root of the target
SET(CMAKE_FIND_ROOT_PATH $ENV{ARM_ROOT})

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
#```

