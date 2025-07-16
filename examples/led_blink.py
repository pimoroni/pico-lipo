from machine import Pin
import time

# Set up the LED as an output
Pin.board.LED.init(mode=Pin.OUT)

# Blink with a frequency of 1Hz, and a duty cycle of 50%
while True:
    Pin.board.LED.toggle()
    time.sleep(0.5)
