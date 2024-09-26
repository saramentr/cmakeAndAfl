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

adb wait-for-device
adb shell "su 0 whoami; cd /sys/devices/system/cpu;su 0 echo performance | tee cpu*/cpufreq/scaling_governor"
adb shell "su 0 whoami;cd /data/local/tmp/;su 0 timeout 10m ./afl-fuzz -O -G 256 -i in -o out ./fuzz"
adb shell "su 0 cat /data/local/tmp/out/default/fuzzer_stats"
