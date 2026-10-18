#!/bin/sh

while true; do
	date_formatted=$(date "+%d %b %Y %H:%M:%S")

    battery_cap=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)
    battery_stat=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null)
    
    case "$battery_stat" in
        "Charging") bat_sym="+" ;;
        "Discharging") bat_sym="-" ;;
        "Full") bat_sym="max" ;;
        "Not charging") bat_sym="null" ;;
        *) bat_sym="=" ;; 
    esac

    ram_usage=$(free -h | awk '/^Mem:/ {print $3}')

    cpu_usage=$(top -bn1 | grep "Cpu(s)" | tr ',' '.' | awk '{printf "%.1f", $2 + $4}')

    echo "CPU: ${cpu_usage}% | RAM: ${ram_usage} | Bat: ${battery_cap}% ${bat_sym} | $date_formatted"
    
    sleep 5
done
