list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/../")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/../../")

# Wakeup module for early GPIO latch
include(modules/c/wakeup/micropython)

# Powman example for low power sleep
include(modules/c/powman/micropython)

include(usermod-common)

# SP/CE screens on the connector. The GC heap lives in PSRAM here, so the displays'
# region is the SRAM it leaves free.
find_package(SPIDISPLAY CONFIG REQUIRED)