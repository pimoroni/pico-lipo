# Pico LiPo <!-- omit in toc -->

## Pimoroni Pico MicroPython for Pico LiPo Boards <!-- omit in toc -->

This repository is home to the MicroPython firmware and examples for Pico LiPo,
Pico LiPo 2 and Pico LiPo 2XL W.

- [Get Pico Lipo](#get-pico-lipo)
- [Download Firmware](#download-firmware)
- [Installation](#installation)


## Get Pico Lipo

* Pico LiPo (4MB, 16MB) - https://shop.pimoroni.com/products/pimoroni-pico-lipo
* Pico LiPo 2 - 
* Pico LiPo 2XL W - 

## Download Firmware

You can find the latest firmware releases at [https://github.com/pimoroni/pico-lipo/releases/latest](https://github.com/pimoroni/pico-lipo/releases/latest).

For each board there are two choices, a regular build that just updates the firmware and a "-with-examples" build which includes a selection of [examples](examples) depending upon your board.

:warning: If you've changed any of the code on your board then back up before flashing "-with-examples" - *your files will be erased!*

## Installation

1. Connect your LiPo board to your computer with a USB Type-C cable.
2. Put your device into bootloader mode by holding down the BOOT button and toggling the power off/on.
3. Drag and drop the downloaded .uf2 to the "RP2350" drive that appears.
4. Your device should reset, and you should be able to connect to it using Thonny.
