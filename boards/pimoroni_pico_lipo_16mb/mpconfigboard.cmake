# cmake file for Pimoroni Pico LiPo 16MB
set(PICO_BOARD "pimoroni_picolipo_16mb")

# Board specific version of the frozen manifest
set(MICROPY_FROZEN_MANIFEST ${MICROPY_BOARD_DIR}/manifest.py)

set(MICROPY_C_HEAP_SIZE 4096)
