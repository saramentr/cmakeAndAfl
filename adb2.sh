#!/bin/bash
adb shell "su 0 "whoami; cd /sys/devices/system/cpu&&echo performance | tee cpu*/cpufreq/scaling_governor&&whoami""
adb shell "su 0 "whoami;cd /data/local/tmp&& AFL_DEBUG=1 ./afl-fuzz -O -G 256 -i in -o out ./fuzz&& whoami"
