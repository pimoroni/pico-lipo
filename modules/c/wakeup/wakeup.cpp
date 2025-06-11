#include "pico/stdlib.h"
#include "hardware/gpio.h"

#if PICO_NUM_GPIOS >= 32
uint64_t gpio_state = 0;
#else
uint32_t gpio_state = 0;
#endif

static void __attribute__((constructor(101))) latch_inputs() {
#if PICO_NUM_GPIOS >= 32
    gpio_set_function_masked64(0xffffffffffffffff, GPIO_FUNC_SIO);
    gpio_state = gpio_get_all64();
    sleep_ms(5);
    gpio_state |= gpio_get_all64();
#else
    gpio_set_function_masked(0xffffffff, GPIO_FUNC_SIO);
    gpio_state = gpio_get_all();
    sleep_ms(5);
    gpio_state |= gpio_get_all();
#endif
}

extern "C" {
#include "wakeup.h"

mp_obj_t Wakeup_get_gpio_state(mp_obj_t button_in) {
    int button = mp_obj_get_int(button_in);
    return (gpio_state & (1 << button)) ? mp_const_true : mp_const_false;
}

mp_obj_t Wakeup_reset_gpio_state() {
    gpio_state = 0;
    return mp_const_none;
}

}