su
cd /sys/devices/system/cpu
echo performance | tee cpu*/cpufreq/scaling_governor
cd /data/local/tmp
./afl-fuzz -O -G 256 -i in -o out ./fuzz
#./afl-fuzz -O -G 256 -t 600000 -i in -o out ./fuzz
#AFL_DEBUG=1 AFL_QEMU_DEBUG_MAPS=1 ./afl-fuzz -O -G 256 -i in -o out ./fuzz
#AFL_DEBUG_CHILD=1 AFL_MAP_SIZE=10000000 AFL_DEBUG=1 AFL_QEMU_DEBUG_MAPS=1 ./afl-fuzz -O -G 256 -i in -o out ./fuzz
#for f in out/default/queue/id*;do xxd $f;done
