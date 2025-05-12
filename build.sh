#!/bin/sh
set -xe
zig build

if [ -d android/build ]; then
    rm -r android/build
fi
mkdir -p android/build/res/drawable-ldpi
mkdir -p android/build/res/drawable-mdpi
mkdir -p android/build/res/drawable-hdpi
mkdir -p android/build/res/drawable-xhdpi
cp assets/icon_ldpi.png android/build/res/drawable-ldpi/icon.png
cp assets/icon_mdpi.png android/build/res/drawable-mdpi/icon.png
cp assets/icon_hdpi.png android/build/res/drawable-hdpi/icon.png
cp assets/icon_xhdpi.png android/build/res/drawable-xhdpi/icon.png
mkdir -p android/build/assets
cp assets/* android/build/assets

mkdir -p android/build/src/dev/calion/test/
./android/sdk/build-tools/29.0.3/aapt package -f -m \
    -I android/sdk/platforms/android-29/android.jar \
    -S android/build/res/ -J android/build/src -M java/AndroidManifest.xml

javac -source 1.8 -target 1.8 -d android/build/obj \
	-bootclasspath jre/lib/rt.jar \
	-classpath android/sdk/platforms/android-29/android.jar:android/build/obj \
	-sourcepath src android/build/src/dev/calion/test/R.java \
	java/NativeLoader.java

mkdir -p android/build/dex/
./android/sdk/build-tools/29.0.3/dx --verbose --dex --output=android/build/dex/classes.dex android/build/obj

./android/sdk/build-tools/29.0.3/aapt package -f \
	-M java/AndroidManifest.xml -S android/build/res -A assets \
	-I android/sdk/platforms/android-29/android.jar -F game.apk android/build/dex

mkdir -p android/lib/arm64-v8a
cd android/
cp ../zig-out/lib/libmain.so lib/arm64-v8a
cp ../raylib/src/libraylib.so lib/arm64-v8a/libraylib.550.so
./sdk/build-tools/29.0.3/aapt add ../game.apk lib/arm64-v8a/libmain.so
./sdk/build-tools/29.0.3/aapt add ../game.apk lib/arm64-v8a/libraylib.550.so
./sdk/build-tools/29.0.3/zipalign -f 4 ../game.apk ../game.final.apk
cd ..

mv -f game.final.apk game.apk

./android/sdk/build-tools/29.0.3/apksigner sign  --ks android/main.keystore --out game.signed.apk --ks-pass pass:main123 game.apk
mv -f game.signed.apk game.apk
