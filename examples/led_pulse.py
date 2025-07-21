from machine import PWM
import time
import math

PULSE_PERIOD = 5   # Seconds

# Set up PWM on our LED pin. We're using Pin 22 in this example.
led = PWM(22)

# 1000Hz frequency
led.freq(1000)

# Pulse the LED
while True:
    # Get the current time in seconds with millisecond precision
    time_seconds = time.ticks_ms() / 1000

    # Sine wave from -1 to +1
    # A full cycle of the sine wave from 0 to 1 and back again is 2 * math.pi
    brightness = math.sin(time_seconds / PULSE_PERIOD * 2 * math.pi)

    # Scale sine wave to 0 to 1
    brightness = (brightness + 1) / 2

    led.duty_u16(int(65535 * brightness))

    # Aim for 60fps ish
    time.sleep(1.0 / 60)
