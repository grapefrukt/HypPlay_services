rm -rf "obj"
echo "Compiling for armv6"
haxelib run hxlibc Build.xml -Dandroid
echo "Compiling for armv7"
haxelib run hxlibc Build.xml -Dandroid -DHXCPP_ARMV7