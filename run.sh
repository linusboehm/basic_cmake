BUILD_DIR=build
mkdir -p $BUILD_DIR
cd $BUILD_DIR
cmake -DCMAKE_BUILD_TYPE=Release ..
make
cd ..
./$BUILD_DIR/bin/main $@
