# cmake file for Pimoroni Pico LiPo 4MB
set(PICO_BOARD "pimoroni_picolipo_4mb")

# Board specific version of the frozen manifest
set(MICROPY_FROZEN_MANIFEST ${MICROPY_BOARD_DIR}/manifest.py)

set(MICROPY_C_HEAP_SIZE 4096)

include(${CMAKE_CURRENT_LIST_DIR}/../common.cmake)
