# Zig + Raylib Android template
### Usage
#### Git clone this and cd into the cloned folder
#### Make a directory called android
#### Download the android ndk and sdk and put them into the android folder renamed to sdk and ndk
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