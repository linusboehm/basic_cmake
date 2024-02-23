BUILD_DIR=build
mkdir -p $BUILD_DIR
cd $BUILD_DIR
cmake -DCMAKE_BUILD_TYPE=Release ..
make
cd ..
ln -s $BUILD_DIR/compile_commands.json compile_commands.json
./$BUILD_DIR/bin/main $@
