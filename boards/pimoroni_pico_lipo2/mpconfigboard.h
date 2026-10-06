// Board and hardware specific configuration
#define MICROPY_HW_BOARD_NAME                   "Pimoroni Pico LiPo 2"

#define MICROPY_PY_NETWORK_HOSTNAME_DEFAULT     "PicoLiPo2"

// Enable PPP
#define MICROPY_PY_NETWORK_PPP_LWIP             (1)

#include "enable_cyw43.h"

#undef MICROPY_HW_PIN_RESERVED
#define MICROPY_HW_PIN_RESERVED(i) (false)

#define CYW43_PIN_WL_DYNAMIC                    (0)
#define CYW43_DEFAULT_PIN_WL_REG_ON             SPCE_TX_MISO_PIN
#define CYW43_DEFAULT_PIN_WL_DATA_OUT           SPCE_RESET_MOSI_PIN
#define CYW43_DEFAULT_PIN_WL_DATA_IN            SPCE_RESET_MOSI_PIN
#define CYW43_DEFAULT_PIN_WL_HOST_WAKE          SPCE_RESET_MOSI_PIN
#define CYW43_DEFAULT_PIN_WL_CLOCK              SPCE_NETLIGHT_SCK_PIN
#define CYW43_DEFAULT_PIN_WL_CS                 SPCE_RX_CS_PIN