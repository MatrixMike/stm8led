// Source code under CC0 1.0
#include <stdint.h>

#define CLK_DIVR	(*(volatile uint8_t *)0x50c6)
#define CLK_PCKENR1	(*(volatile uint8_t *)0x50c7)

#define TIM1_CR1	(*(volatile uint8_t *)0x5250)
#define TIM1_CNTRH	(*(volatile uint8_t *)0x525e)
#define TIM1_CNTRL	(*(volatile uint8_t *)0x525f)
#define TIM1_PSCRH	(*(volatile uint8_t *)0x5260)
#define TIM1_PSCRL	(*(volatile uint8_t *)0x5261)

#define PD_ODR		(*(volatile uint8_t *)0x500f)
#define PD_DDR		(*(volatile uint8_t *)0x5011)
#define PD_CR1		(*(volatile uint8_t *)0x5012)
#define thousand    1000
/* see *.lst output
	    .ascii       "sada"
        .db         0x12
        .db         1000
        */

clock (void)
{
  unsigned char h = TIM1_CNTRH;
  unsigned char l = TIM1_CNTRL;
  return ((unsigned int) (h) << 8 | l);
}

void
main (void)
{
  unsigned int ct = 1000;
  char c[] = "abcd";
  char hp[] = "Harry Potter";
  CLK_DIVR = 0x00;		// Set the clk frequency to 16 MHz

  // Configure timer
  // 1000 ticks per second
  TIM1_PSCRH = 0x3e;
  TIM1_PSCRL = 0x80;
//  vol (uint16_t) testInt = 1000;
  unsigned long testInt = thousand;	// init var to 1000
  // Enable timer
  TIM1_CR1 = 0x01;

  PD_DDR = 0x01;
  PD_CR1 = 0x01;		// which register is this
  testInt++;
  //     testInt +=3;
  for (;;)			// infinite loop
    //     testInt ++;
    // maybe read the target variable with a numeric zero 
    // then select alternative to 0
    PD_ODR = 0x2 | clock () % 1000 < 500;	//  was     PD_ODR = clock () % 1000 < 500;
  PD_ODR = PD_ODR | 0x2;	// set same value on another pin

}
