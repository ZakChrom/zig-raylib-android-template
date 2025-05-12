#!/bin/bash
set -xe

cd android
if [ -e main.keystore ]; then
    rm main.keystore
fi
# Change name and passwords here
keytool -genkeypair -validity 1000 -dname "CN=main,O=Android,C=ES" \
    -keystore main.keystore -storepass 'main123' -keypass 'main123' \
    -alias projectKey -keyalg RSA
cd ..
