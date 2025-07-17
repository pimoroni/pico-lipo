# Programming Pico LiPo with C++

## Read The Manual

If you're new to Pico development you should read Raspberry Pi's own getting
started guide and set your system up with the SDK and toolchain:

https://www.raspberrypi.com/documentation/microcontrollers/c_sdk.html

The rest of these instructions assume you have a passing familiarity with the
SDK

## Install Dependencies

You'll need Pico SDK, Pimoroni Pico (C++ drivers for our modules), Pico
Boilerplate (a boilerplate project for Pico) Pico LiPo (board definitions.)

To fetch these, create a new project directory and:

```
git clone https://github.com/raspberrypi/pico-sdk
git clone https://github.com/pimoroni/pico-lipo
git clone https://github.com/pimoroni/pimoroni-pico
git clone https://github.com/pimoroni/pico-boilerplate
```

```
cd pico-sdk
git submodule update --init
```

You can use existing Pico SDK and Pimoroni Pico clones if you'd prefer, but
you will have to adjust the paths below accordingly.

## Build The Boilerplate

Before we make any changes, let's confirm the boilerplate and dependencies
are installed and that we can build it:

```
cd pico-boilerplate
mkdir build
cd build
cmake .. -DPICO_BOARD=pimoroni_pico_lipo2xl_w -DPICO_BOARD_HEADER_DIRS=../../pico-lipo/boards/pimoroni_pico_lipo2xl_w -DPICO_SDK_PATH=../../pico-sdk
make -j
```

Change the `DPICO_BOARD_HEADER_DIRS` and `PICO_BOARD` values to match the board
you want to develop for! You'll find these in the `boards/` directory of the
Pico LiPo repository.

## Make Sure Code Runs

Now grab the entire contents of the Pico Examples "blink" example from:

https://github.com/raspberrypi/pico-examples/blob/master/blink/blink.c

Replace `main.cpp` with blink, and don't forget to link the `pico_cyw43_arch_none`
library in `CMakeLists.txt` by adding the following just below the first
`target_link_libraries` call:

```cmake
if (PICO_CYW43_SUPPORTED)
    target_link_libraries(${NAME} pico_cyw43_arch_none)
endif()
```

Run `make -j` to build the blink example, then copy the `pico-boilerplate.uf2`
file to your board:

1. Connect your LiPo board to your computer with a USB Type-C cable.
2. Put your device into bootloader mode by holding down the BOOT button and toggling the power off/on.
3. Drag and drop `pico-boilerplate.uf2` to the "RP2350" drive that appears.
4. Your device should reset, and the LED should start blinking.

