#!/bin/bash

cpu_temp=$(sensors | \
	grep -A2 k10temp | \
	grep Tctl | \
	awk {'print substr($2, 2)'})	# removes the '+' from temperature.

gpu_temp=$(sensors | \
	grep -A4 amdgpu | \
	grep edge | \
	awk {'print substr($2, 2)'})

echo " CPU: $cpu_temp — GPU: $gpu_temp"
