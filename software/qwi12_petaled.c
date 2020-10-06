//*****************************************************************************
//    # #              Name   : qwi12_petaled.c
//  #     #            Date   : Oct. 06, 2020
// #    #  #  #     #  Author : Qiwei Wu
//  #     #  # #  # #  Version: 1.0
//    # #  #    #   #
// This module is the GPIO control application of qwi12_petaled project.
//*****************************************************************************

//*****************************************************************************
// Headers
//*****************************************************************************
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>

//*****************************************************************************
// Variables
//*****************************************************************************
#define PRJ_N "qwi12_petaled"
#define H_VER 1
#define L_VER 0

//*****************************************************************************
// Functions
//*****************************************************************************
int main()
{
   int value;
   int export;
   int direction;

   printf("\r\n========================================\r\n");
   printf("=   Project: %s. Ver:v%d.%d   =\r\n", PRJ_N, H_VER, L_VER);
   printf("=   Date: %s, %s        =\r\n", __DATE__, __TIME__);
   printf("========================================\r\n");

   // export GPIO controller
   export = open("/sys/class/gpio/export", O_WRONLY);
   if (export < 0)
   {
      printf("Cannot open GPIO controller export\n");
      exit(1);
   }

   write(export, "905", 4);
   close(export);

   printf("GPIO controller export successfully\n");

   // Modify GPIO controller direction
   direction = open("/sys/class/gpio/gpio905/direction", O_RDWR);
   if (direction < 0)
   {
      printf("Cannot open GPIO controller direction\n");
      exit(1);
   }

   write(direction, "out", 4);
   close(direction);

   printf("GPIO controller direction changed to output successfully\n");

   // Modify GPIO controller value
   value = open("/sys/class/gpio/gpio905/value", O_RDWR);
   if (value < 0)
   {
      printf("Cannot open GPIO controller value\n");
      exit(1);
   }

   // Swap GPIO controller value each 1 second
   while (1)
   {
      sleep(1);
      write(value,"1", 2);
      //printf("GPIO controller value changed to 1 successfully\n");

      sleep(1);
      write(value,"0", 2);
      //printf("GPIO controller value changed to 0 successfully\n");
   }
}
