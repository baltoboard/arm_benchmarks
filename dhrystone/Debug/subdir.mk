################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../dhrystone.c 

OBJS += \
./dhrystone.o 

C_DEPS += \
./dhrystone.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM Sourcery Linux GCC C Compiler'
	arm-none-linux-gnueabi-gcc -O3 -msoft-float -march=armv7-a -mtune=cortex-a8 -c -DTIME -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -mcpu=cortex-a8 -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


