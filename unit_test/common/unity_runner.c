#include "unity_fixture.h"
#include "stm32f7xx.h"

extern void runAllTests(void);

void USART3_Init(void)
{
    // Enable USART3 clock
    RCC->APB1ENR |= RCC_APB1ENR_USART3EN;

    // Configure GPIO for USART3 (TX: PD8, RX: PD9)
    // Enable GPIOD clock
    RCC->AHB1ENR |= RCC_AHB1ENR_GPIODEN;

    // Set alternate function AF7 to PD8 and PD9 pin
    // Pins GPIOD8-15 are in AFRH register - in GPIO definition it is AFR[1]
    // AF7 is coded as 0b0111 so we need to set bits from 0 to 2
    // PD8 pin is at AFRH0 position
    GPIOD->AFR[1] &= ~GPIO_AFRH_AFRH0_Msk;
    GPIOD->AFR[1] |= GPIO_AFRH_AFRH0_0 | GPIO_AFRH_AFRH0_1 | GPIO_AFRH_AFRH0_2;
    // PD9 pin is at AFRH1 position
    GPIOD->AFR[1] &= ~GPIO_AFRH_AFRH1_Msk;
    GPIOD->AFR[1] |= GPIO_AFRH_AFRH1_0 | GPIO_AFRH_AFRH1_1 | GPIO_AFRH_AFRH1_2;

    // set GPIO mode as AF (Alternate funciton)
    // AF mode is coded as 0b10 so we need to set bit 1 for each GPIO that we are using
    // PD8 pin confiugration
    GPIOD->MODER &= ~GPIO_MODER_MODER8_Msk;
    GPIOD->MODER |= GPIO_MODER_MODER8_1;
    GPIOD->MODER &= ~GPIO_MODER_MODER9_Msk;
    GPIOD->MODER |= GPIO_MODER_MODER9_1;
    
    // Configure USART3 to 115200bps
    // Clear all bits of control register - disable USART
    USART3->CR1 = 0;

    // We didn't configured system clocks. Default core and peripheral clock (fclk) is 16MHz.
    // Default oversampling is 16 (bit OVER8 in CR1 reset)
    //
    // We can now calculate USARTDIV:
    // for oversampling by 16:
    // baudrate = fck / USARTDIV
    //
    // After rearranging the equation
    // USARTDIV = fck / baudrate
    //
    // USARTDIV = 16000000 / 115200
    // USARTDIV = 139
    //
    // When oversampling is set to 16 (OVER8 = 0) then BRR = USARTDIV
    USART3->BRR = 139;

    // Enable receiver and transmitter
    USART3->CR1 |= USART_CR1_RE | USART_CR1_TE;
    // Enable USART3
    USART3->CR1 |= USART_CR1_UE;
}

void uart_putchar(const char c) {
    // Wait in loop to flush previously sent data
    while (!(USART3->ISR & USART_ISR_TXE)) {}

    // Send character - put it in Transmit Data Register
    USART3->TDR = (uint16_t)c;
}

void SystemInit(void)
{
    USART3_Init();
}

void main(void)
{
    UnityMain(0, NULL, runAllTests);
}
