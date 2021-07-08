#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"


const int BLINK_GPIO = GPIO_NUM_2;

void app_main() {
    gpio_set_direction(BLINK_GPIO, GPIO_MODE_OUTPUT);
    int cnt = 0;
   while(true) {
//        vTaskDelay(1000 / portTICK_RATE_MS);
       vTaskDelay(1000 / portTICK_RATE_MS);
       gpio_set_level(BLINK_GPIO, cnt % 2);
//        ets_delay_us(1);
       cnt += 1;
//        gpio_set_level(BLINK_GPIO, 1);
//        ets_delay_us(1000);
   }
}
