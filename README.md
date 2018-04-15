# TempAlert
A simple shell script to turn on the capslock LED to indicate temperature. Made for Linux based distributions

You can select your temperature sensor, and capslock LED (or any other LED for that matter, say numlock?) by editing a few variables

<b>temp_sensor</b> selects the temperature sensor. All temp sensors are listed in the <i>/sys/class/thermal/</i> directory, as <i>thermal_zoneX</i> example, <i>thermal_zone0</i> or <i>thermal_zone1</i>. You have to include the <i>temp</i> file in the sensor's directory

<b>threshold</b> simply decides the threshold temperature below which the LED is off, and above which, the LED is on.

<b>caps_led</b> selects the LED. All LEDs are listed in the <i>/sys/class/leds/</i> directory. You have to include the <i>brightness</i> file for the sensor for it to work

Refer to the defaults in the script for clarification.
