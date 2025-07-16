# Wakeup - RP2 Startup GPIO Latching

The `wakeup` module runs at startup, enables all GPIO as inputs and stores the initial GPIO state.

It can be used to detect pin states at power on, useful for latching button presses - they might be released before MicroPython fully boots - or other transient wakeup signals where you otherwise can't use powman's wake on GPIO.

## Get State

To get the wakeup state for a specific GPIO, call:

```python
import wakeup
wakeup.get_gpio_state(gpio)
```

## Reset State

If you've handled wakeup GPIO state and need to reset it back to 0 (doesn't change any pin states, just clears the stored value) then call:

```python
import wakeup
wakeup.reset_gpio_state()
```