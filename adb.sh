#!/bin/bash
adb wait-for-device
cd /opt/AFLplusplus-4.06c/build/&& adb push afl-fuzz afl-frida-trace.so /data/local/tmp
cd /opt/android-fuzzing/native/build&&adb push fuzz ../afl.js ../lib/libblogfuzz.so /data/local/tmp
#cd /opt/android-fuzzing/wlinked_jni/build/&&adb push fuzz ../afl.js ../lib/libblogfuzz.so ../lib/libjenv.so  /data/local/tmp
#cd /opt/android-fuzzing/slinked_jni/build/&&adb push fuzz ../afl.js ../lib/libblogfuzz.so ../lib/libjenv.so ../mock.dex ../../apk/qb.blogfuzz.apk /data/local/tmp
adb shell mkdir /data/local/tmp/in
adb shell mkdir /data/local/tmp/out
adb shell dd if=/dev/urandom of=/data/local/tmp/in/sample.bin bs=1 count=16

adb root
adb disable verity
adb remount
adb reboot
