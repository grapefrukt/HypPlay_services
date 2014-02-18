rm -rf "obj"
echo "Compiling for armv6"
haxelib run hxlibc Build.xml -Dandroid -debug
