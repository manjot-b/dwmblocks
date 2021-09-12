#!/bin/bash

interface=eno1

rx_old=$(cat /sys/class/net/$interface/statistics/rx_bytes)
tx_old=$(cat /sys/class/net/$interface/statistics/tx_bytes)

sleep 1

rx_new=$(cat /sys/class/net/$interface/statistics/rx_bytes)
tx_new=$(cat /sys/class/net/$interface/statistics/tx_bytes)

# 8 bits in a byte and need it in kilobits/sec.
rx_kbps=$(((rx_new - rx_old) / 128))
tx_kbps=$(((tx_new - tx_old) / 128))

rx_band="$rx_kbps kbps"
if [[ rx_kbps -gt 1024 ]]; then
	rx_band="$((rx_kbps / 1024)) Mbps"
fi

tx_band="$tx_kbps kbps"
if [[ tx_kbps -gt 1024 ]]; then
	tx_band="$((tx_kbps / 1024)) Mbps"
fi

printf "\x0c $rx_band \x0d祝 $tx_band\x0b"
