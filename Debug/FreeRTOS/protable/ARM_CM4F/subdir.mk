################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../FreeRTOS/protable/ARM_CM4F/port.c 

OBJS += \
./FreeRTOS/protable/ARM_CM4F/port.o 

C_DEPS += \
./FreeRTOS/protable/ARM_CM4F/port.d 


# Each subdirectory must supply rules for building sources it contributes
FreeRTOS/protable/ARM_CM4F/port.o: ../FreeRTOS/protable/ARM_CM4F/port.c FreeRTOS/protable/ARM_CM4F/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/Embedded_OS_Lab2_P76091218/FreeRTOS/include" -I"C:/Users/User/STM32CubeIDE/workspace_1.6.0/Embedded_OS_Lab2_P76091218/FreeRTOS/protable/ARM_CM4F" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"FreeRTOS/protable/ARM_CM4F/port.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

