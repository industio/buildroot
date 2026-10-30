#!/bin/bash

# 检查路径是否存在
if [ -e /sys/devices/platform/dmc/devfreq/dmc/governor ]; then
	echo performance > /sys/devices/platform/dmc/devfreq/dmc/governor
else
	echo "路径 /sys/devices/platform/dmc/devfreq/dmc/governor 不存在，跳过此步骤"
fi

# 循环遍历 cpu0 到 cpu7
for i in {0..3}
do
	# 确保路径存在再执行操作
	if [ -e /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor ]; then
		echo performance > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor
	else
		echo "CPU $i 的 scaling_governor 不存在"
	fi

	if [ -e /sys/devices/system/cpu/cpu$i/cpuidle/state0/disable ]; then
		echo 1 > /sys/devices/system/cpu/cpu$i/cpuidle/state0/disable
	else
		echo "CPU $i 的 state0/disable 不存在"
	fi

	if [ -e /sys/devices/system/cpu/cpu$i/cpuidle/state1/disable ]; then
		echo 1 > /sys/devices/system/cpu/cpu$i/cpuidle/state1/disable
	else
		echo "CPU $i 的 state1/disable 不存在"
	fi

done
