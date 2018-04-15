#!/bin/bash
# THIS SCRIPT NEEDS TO BE RUN WITH ROOT PERMISSION

# ==========All the init parameters==========
# This is your temp sensor, change it to suit your use case. The "temp" file holds the temperature
temp_sensor="/sys/class/thermal/thermal_zone0/temp"
# Threshold temperature
threshold=50
# Location of your capslock led, again, change it to suit your use case. Select the "brightness" file
caps_led="/sys/class/leds/input5::capslock/brightness"
# ==================================================
while true #infinite loop
do
	read temp < $temp_sensor #reads the temperature of temp sensor
	read state < $caps_led #reads the state of the capslock LED by reading the brightness file
	temp=$(( $temp / 1000)) #on my machine the temperature is read in C*1000, so I divide it by 1000. You can comment this out, or edit it
	if [ $temp -gt $threshold ]; then # if temp > threshold
		if [ $state -ne 1 ]; then # if the LED is off
			echo 1 > $caps_led # turn the LED on
		fi
	fi

	if [ $temp -lt $threshold ]; then # if temp < threshold
		if [ $state -ne 0 ]; then # if the LED is on
			echo 0 > $caps_led # turn the LED off
		fi
	fi
	
	sleep 1 # sleep for 1 sec, you can change this
done
exit 0
