# Powman - RP2350 Deep Sleep, GPIO & AON Timer Wakeup <!-- omit in toc -->

The `powman` module glues some basic RP2350 `powman` logic into MicroPython, allowing you to send your board into a deep sleep.

It will:

1. Clock everything from pll_usb (48mhz) and stop pll_sys
2. Set the 1khz tick source to the low-power oscillator (note: this results in inaccurate timing)
3. Set all pins to input
4. Disable all pulls
5. Turn off the USB PHY and pull down D+ and D-
6. Start and set the powman_timer

:warning: `powman` is a little experimental and might be prone to weirdness or failure.

- [Goto dormant until pin](#goto-dormant-until-pin)
- [Goto dormant until time](#goto-dormant-until-time)
- [Goto dormant for (seconds)](#goto-dormant-for-seconds)
- [Get wake reason](#get-wake-reason)
- [Caveats](#caveats)

## Goto dormant until pin

Go to sleep until the edge/polarity condition is met on the supplied GPIO(s).

```python
import powman
powman.goto_dormant_until_pin(gpio, edge, high, <timeout>)
```

* `gpio` - should be a single GPIO, or optionally be a tuple of up to three GPIOs which will occupy wake channels 0, 1 and 2.
* `edge` - a bool indicating whether to trigger on the leading (true) or trailing (false) edge
* `high` - a bool indicating active high (true) or active low (false)
* `timeout` - (optional) timeout, in seconds, after which the board will wake from sleep

:warning: Note: Timeout values are approximate, since the low-power oscillator does not keep accurate time. Shorter values will tend to be more reliable, longer values may be wildly inaccurate.

## Goto dormant until time

Accepts a fixed array of year, month, mday, hour, min, sec and puts the board into deep sleep until this time is reached.

```python
import powman
powman.goto_dormant_until((year, mon, mday, hour, min, sec))
```

:warning: Note: Time values are approximate, since the low-power oscillator does not keep accurate time.

## Goto dormant for (seconds)

Go to sleep for the given number of seconds.

```python
import powman
powman.goto_dormant_for(time_seconds)
```

:warning: Note: Timeout values are approximate, since the low-power oscillator does not keep accurate time. Shorter values will tend to be more reliable, longer values may be wildly inaccurate.

## Get wake reason

The wake reason indicates which GPIO channel woke up the board, or otherwise if a timer interrupt triggered the wake. Unknown usually means a hard reset (physical reset button) or cold boot is the wake reason.

Constants are provided for wake reason:

* `WAKE_CHANNEL_0 = 0`
* `WAKE_CHANNEL_1 = 1`
* `WAKE_CHANNEL_2 = 2`
* `WAKE_TIMER = 240`
* `WAKE_UNKNOWN = 255`

## Caveats

The boot/user button on Pico LiPo 2 (45) and Pico LiPo 2XL W (30) cannot be used as a wake button, since the board will wake up in bootloader mode.