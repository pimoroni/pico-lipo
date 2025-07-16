import powman
import machine
import time

# Save this file as main.py
#
# From the repl run:
# powman.goto_dormant_until_pin(0, False, False)
#
# Short GPIO 0 to Ground
# The board should wake, and the green LED will flash

if powman.get_wake_reason() == powman.WAKE_CHANNEL_0:
    led = machine.Pin("LED", machine.Pin.OUT)
    for _ in range(10):
        led.toggle()
        time.sleep(0.1)
