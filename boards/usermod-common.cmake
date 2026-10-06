if(NOT DEFINED PIMORONI_PICO_PATH)
set(PIMORONI_PICO_PATH ../pimoroni-pico)
endif()
include(${CMAKE_CURRENT_LIST_DIR}/../pimoroni_pico_import.cmake)

include_directories(${PIMORONI_PICO_PATH}/micropython)

list(APPEND CMAKE_MODULE_PATH "${PIMORONI_PICO_PATH}/micropython")
list(APPEND CMAKE_MODULE_PATH "${PIMORONI_PICO_PATH}/micropython/modules")

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Essential
include(pimoroni_i2c/micropython)
include(pimoroni_bus/micropython)

# Pico Graphics Essential
include(bitmap_fonts/micropython)
include(picographics/micropython)

# Pico Graphics Extra
include(pngdec/micropython)
include(jpegdec/micropython)
include(picovector/micropython)
include(qrcode/micropython/micropython)

# Sensors & Breakouts
include(micropython-common-breakouts)

# Packs & Bases
include(pico_unicorn/micropython)
include(pico_scroll/micropython)
include(pico_rgb_keypad/micropython)
include(pico_explorer/micropython)

# LEDs & Matrices
include(plasma/micropython)
include(hub75/micropython)

# Servos & Motors
include(pwm/micropython)
include(servo/micropython)
include(encoder/micropython)
include(motor/micropython)

# Utility
include(adcfft/micropython)

# Must call `enable_ulab()` to enable
include(micropython-common-ulab)
enable_ulab()

# C++ Magic Memory
include(cppmem/micropython)

include(cxx_terminate/micropython)
