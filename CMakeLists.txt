cmake_minimum_required(VERSION 2.8.6)

project(superbuild NONE)

include(setup-superbuild.cmake)

include(setup-project-variables.cmake)

include(external-project-macros.cmake)

message(STATUS "hello,world3")

install_eigen()
fetch_pcl()
fetch_boost()
fetch_flann()

set(tags)

if(BUILD_ANDROID)
 list(APPEND tags android)
endif()
if(BUILD_IOS_DEVICE)
 list(APPEND tags ios-device)
endif()
if(BUILD_IOS_SIMULATOR)
 list(APPEND tags ios-simulator)
endif()

message(STATUS "building platform for : ${tags}")

foreach(tag ${tags})
   
    crosscompile_boost(${tag})
  #  crosscompile_flann(${tag})
    crosscompile_pcl(${tag})
endforeach()

# if (BUILD_IOS_DEVICE AND BUILD_IOS_SIMULATOR)
#   create_pcl_universal_framework()
# elseif(BUILD_IOS_DEVICE)
#   create_pcl_ios_framework()
# elseif(BUILD_IOS_SIMULATOR)
#   create_pcl_simulator_framework()
# endif()
