
#rm -Rf build
#mkdir build
cd build

export CC="clang"
export CXX="clang++"
export CXXFLAGS="-stdlib=libc++"

#cmake clean cache
cmake -DBUILD_ANDROID:BOOL="OFF" -DBUILD_IOS_DEVICE="ON" -DBUILD_IOS_SIMULATOR="OFF" -DCMAKE_TOOLCHAIN_FILE=/Volumes/mac-data/Developer_Slow/cpp/vcpkg/scripts/buildsystems/vcpkg.cmake  ../

make -j16 VERBOSE=1 
