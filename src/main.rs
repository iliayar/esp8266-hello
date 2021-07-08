#![no_std]
#![no_main]

extern crate esp8266_sys;

use core::panic::PanicInfo;
use esp8266_sys::*;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

const BLINK_GPIO: gpio_num_t = gpio_num_t_GPIO_NUM_2;

#[no_mangle]
pub fn app_main() {
    unsafe {
        rust_blink_and_write();
    }
}

unsafe fn rust_blink_and_write() {
    gpio_set_direction(BLINK_GPIO, gpio_mode_t_GPIO_MODE_OUTPUT);
    let mut cnt: u32 = 0;

    gpio_set_level(BLINK_GPIO, 0);
    loop {
        vTaskDelay(1000 / portTICK_RATE_MS);
        gpio_set_level(BLINK_GPIO, cnt % 2);
        cnt += 1;
    }
}
