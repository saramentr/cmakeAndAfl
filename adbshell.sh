su
cd /sys/devices/system/cpu
echo performance | tee cpu*/cpufreq/scaling_governor
cd /data/local/tmp
./afl-fuzz -O -G 256 -i in -o out ./fuzz
AFL_DEBUG=1 AFL_QEMU_DEBUG_MAPS=1 ./afl-fuzz -O -G 256 -i in -o out ./fuzz
