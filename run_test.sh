BUILD_DIR=test_build
mkdir -p $BUILD_DIR
cd $BUILD_DIR
cmake -DCMAKE_BUILD_TYPE=Debug ..
make
cd ..
./$BUILD_DIR/bin/some_test $@

