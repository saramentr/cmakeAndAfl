#!/bin/bash
adb wait-for-device
adb shell "su 0 whoami; cd /sys/devices/system/cpu;su 0 echo performance | tee cpu*/cpufreq/scaling_governor"
adb shell "su 0 whoami;cd /data/local/tmp/;su 0 ./afl-fuzz -O -G 256 -i in -o out ./fuzz"
