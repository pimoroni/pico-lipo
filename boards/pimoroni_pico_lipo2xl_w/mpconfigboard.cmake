# cmake file for Pimoroni Pico LiPo
set(PICO_BOARD "pimoroni_pico_lipo2xl_w")
set(PICO_PLATFORM "rp2350")

set(PICO_BOARD_HEADER_DIRS ${CMAKE_CURRENT_LIST_DIR})

# To change the gpio count for QFN-80
set(PICO_NUM_GPIOS 48)

# 8MB PSRAM on GPIO47
set(MICROPY_HW_ENABLE_PSRAM 1)
set(MICROPY_HW_PSRAM_CS_PIN 47)

# Links micropy_lib_lwip and sets MICROPY_PY_LWIP = 1
# Picked up and expanded upon in mpconfigboard.h
set(MICROPY_PY_LWIP ON)

include(enable_cyw43.cmake)

# Board specific version of the frozen manifest
set(MICROPY_FROZEN_MANIFEST ${MICROPY_BOARD_DIR}/manifest.py)

set(PIMORONI_UF2_MANIFEST ${CMAKE_CURRENT_LIST_DIR}/manifest.txt)
set(PIMORONI_UF2_DIR ${CMAKE_CURRENT_LIST_DIR}/../../examples)
include(${CMAKE_CURRENT_LIST_DIR}/../common.cmake)
