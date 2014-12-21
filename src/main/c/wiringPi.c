// Fake wiring pi functions.
#include <stdio.h>

/**
 * Utilities.
 */
void printBytes(unsigned char * data, int len) {
  for (int i = 0; i < len; i ++) {
    if (i > 0) printf(" ");
    printf("%02X", data[i]);
  }
}

/**
This sets the mode of a pin to either INPUT, OUTPUT, PWM_OUTPUT or GPIO_CLOCK. Note that only wiringPi pin 1 (BCM_GPIO 18) supports PWM output and only wiringPi pin 7 (BCM_GPIO 4) supports CLOCK output modes.

This function has no effect when in Sys mode. If you need to change the pin mode, then you can do it with the gpio program in a script before you start your program.
**/
void pinMode (int pin, int mode) {
  printf("pinMode: pin=%d, mode=%d\n", pin, mode);
}

/**
This sets the pull-up or pull-down resistor mode on the given pin, which should be set as an input. Unlike the Arduino, the BCM2835 has both pull-up an down internal resistors. The parameter pud should be; PUD_OFF, (no pull up/down), PUD_DOWN (pull to ground) or PUD_UP (pull to 3.3v) The internal pull up/down resistors have a value of approximately 50KΩ on the Raspberry Pi.

This function has no effect on the Raspberry Pi’s GPIO pins when in Sys mode. If you need to activate a pull-up/pull-down, then you can do it with the gpio program in a script before you start your program.
**/
void pullUpDnControl (int pin, int pud) {
}

/**
Writes the value HIGH or LOW (1 or 0) to the given pin which must have been previously set as an output.

WiringPi treats any non-zero number as HIGH, however 0 is the only representation of LOW.
**/
void digitalWrite (int pin, int value) {
  printf("digitalWrite: pin=%d, value=%d\n", pin, value);
}

/**
Writes the value to the PWM register for the given pin. The Raspberry Pi has one on-board PWM pin, pin 1 (BMC_GPIO 18, Phys 12) and the range is 0-1024. Other PWM devices may have other PWM ranges.

This function is not able to control the Pi’s on-board PWM when in Sys mode.
**/
void pwmWrite (int pin, int value) {
  printf("pwmWrite: pin=%d, value=%d\n", pin, value);
}

/**
This function returns the value read at the given pin. It will be HIGH or LOW (1 or 0) depending on the logic level at the pin.
**/
int digitalRead (int pin) {
  printf("digitalRead: pin=%d\n", pin);
  return 1;
}

/**
This returns the value read on the supplied analog input pin. You will need to register additional analog modules to enable this function for devices such as the Gertboard, quick2Wire analog board, etc.
**/
int analogRead (int pin) {
  return 10;
}

/**
This writes the given value to the supplied analog pin. You will need to register additional analog modules to enable this function for devices such as the Gertboard.
**/
void analogWrite (int pin, int value) {
}

/**
This is the way to initialise a channel (The Pi has 2 channels; 0 and 1). The speed parameter is an integer in the range 500,000 through 32,000,000 and represents the SPI clock speed in Hz.

The returned value is the Linux file-descriptor for the device, or -1 on error. If an error has happened, you may use the standard errno global variable to see why.
**/
int wiringPiSPISetup (int channel, int speed) {
  printf("wiringPiSPISetup: channel=%d, speed=%d\n", channel, speed);
  return 1;
}

/**
This performs a simultaneous write/read transaction over the selected SPI bus. Data that was in your buffer is overwritten by data returned from the SPI bus.

That’s all there is in the helper library. It is possible to do simple read and writes over the SPI bus using the standard read() and write() system calls though – write() may be better to use for sending data to chains of shift registers, or those LED strings where you send RGB triplets of data. Devices such as A/D and D/A converters usually need to perform a concurrent write/read transaction to work.
**/
int wiringPiSPIDataRW (int channel, unsigned char * data, int len) {
  printf("wiringPiSPIDataRW: channel=%d, len=%d, data=", channel, len);
  printBytes(data, len);
  printf("\n");
  return len;
}
