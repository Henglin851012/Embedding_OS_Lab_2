"# lab1-traffic-light-Henglin851012" 
"# demo" 

# 作業要求:

1.Must use sensor interrupt : motion detection

2.Please use the deferred interrupt handling task.
  a)Use semephore.
  b)ISR will give the semephore and the handler task enters the running state.

3.At the beginning,the green LED blinking,then shake the board, the red LED triggered（switch state） by ISR and the orange LED blinking five times in handler task.
  
4.When orange LED blinking, you should not trigger the sensor interrupt if you shake the board.

先create 2個 task , xSemaphoreCreateBinary():

## 1.vHandletask():
```c=
BaseType_t xhandletask = xTaskCreate(vHandletask,"HANDLE",128, NULL,2,NULL);
void vHandletask(){
  for(;;){
    if(xSemaphoreTake(xSemaphore,255)== pdTRUE){
      for(int i=0;i<5;i++){ //閃爍5次
        HAL_GPIO_WritePin(Orange_LED_GPIO_Port,GPIO_PIN_13,1);//橘燈亮起
        vTaskDelay(1000);
        HAL_GPIO_WritePin(Orange_LED_GPIO_Port,GPIO_PIN_13,0);//橘燈關閉
        vTaskDelay(1000);
      }
      table_init();
    }
  }
}
```

當 vHandletask() 成功接收到 semephore 時，Handler task 就會執行「橘燈閃爍 5 次」

## 2.vLEDtask():
```c=
void vLEDtask(){
  for(;;){ // 處理綠燈持續閃爍
    HAL_GPIO_WritePin(Green_LED_GPIO_Port,GPIO_PIN_12,1);
    vTaskDelay(1000);
    HAL_GPIO_WritePin(Green_LED_GPIO_Port,GPIO_PIN_12,0);
    vTaskDelay(1000);
  }
}
```

vLEDtask()要做的事情是「綠燈不斷閃爍」

## ISR:
```c=
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_PIN)
{
	HAL_GPIO_TogglePin(GPIOD, GPIO_PIN_14);
}
```

ISR 要做的事情就是「改變 Red LED state」 和「give a semaphore」, 將 ISR 的內容寫在 main.c 的 HAL_GPIO_EXTI_Callback() 裡
  
