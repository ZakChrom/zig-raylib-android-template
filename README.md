# Zig + Raylib Android template
### Usage
#### Git clone this and cd into the cloned folder
#### Make a directory called android
#### Download the android ndk and sdk and unzip them in the android folder with their folders renamed to ndk and sdk
#### Then run these commands:
```
# I dont think its necessary to cd but im too lazy to test
cd android/sdk/cmdline-tools/bin/
./sdkmanager --update --sdk_root=../../
./sdkmanager --install "build-tools;29.0.3" --sdk_root=../../
./sdkmanager --install "platform-tools" --sdk_root=../..
./sdkmanager --install "platforms;android-29" --sdk_root=../../
cd ../../../../
```
#### Then run build_raylib.sh make_keystore.sh and finally build.sh in that order
#### Now you have game.apk :cat_thubms:
#### Remember to change the make_keystore.sh to not have the default password and name
#### Also change the build.sh and files in java directory to have your package names instead of dev.calion.test
#### Also also change the icons in assets folder to have your icons
#### Also also also check raylibs wiki for any weird stuff about android or info thats not here

##### Credit: raylibs wiki that this tutorial is based on