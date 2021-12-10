// Software Development code in Vitis IDE
#include <stdio.h>
#include "platform.h"
#include "xil_types.h"
#include "xparameters.h"
#include "xcounter.h"


u8 *baseaddr_p = (u8 *)XPAR_MYIP_AES_BRAM_0_S00_AXI_BASEADDR;

int main()
{
	init_platform();
	xil_printf("AES128 Encryption\n\r");
	XCounter xc;
    XCounter* xcptr = &xc;
	XCounter_Initialize(xcptr, 0);
	XCounter_EnableAutoRestart(xcptr);
	XCounter_Start(xcptr);
	int t1, t2;
	t1 = XCounter_Get_return(xcptr);

	    //Data
		*(baseaddr_p+15) = 0x01;
		*(baseaddr_p+14) = 0x01;
		*(baseaddr_p+13) = 0x01;
		*(baseaddr_p+12) = 0x01;
		*(baseaddr_p+11) = 0x01;
		*(baseaddr_p+10) = 0x01;
		*(baseaddr_p+9) = 0x01;
		*(baseaddr_p+8) = 0x01;
		*(baseaddr_p+07) = 0x01;
		*(baseaddr_p+06) = 0x01;
		*(baseaddr_p+05) = 0x01;
		*(baseaddr_p+04) = 0x01;
		*(baseaddr_p+03) = 0x01;
		*(baseaddr_p+02) = 0x01;
		*(baseaddr_p+01) = 0x01;
		*(baseaddr_p+00) = 0x01;

        //key
		*(baseaddr_p+31) = 0x02;
		*(baseaddr_p+30) = 0x01;
		*(baseaddr_p+29) = 0x01;
		*(baseaddr_p+28) = 0x01;
		*(baseaddr_p+27) = 0x01;
		*(baseaddr_p+26) = 0x01;
		*(baseaddr_p+25) = 0x01;
		*(baseaddr_p+24) = 0x01;
		*(baseaddr_p+23) = 0x01;
		*(baseaddr_p+22) = 0x01;
		*(baseaddr_p+21) = 0x01;
		*(baseaddr_p+20) = 0x01;
		*(baseaddr_p+19) = 0x01;
		*(baseaddr_p+18) = 0x01;
		*(baseaddr_p+17) = 0x01;
		*(baseaddr_p+16) = 0x02;

  t2 = XCounter_Get_return(xcptr);
  xil_printf("Number of cycles: %d\n\r ",t2-t1);

	setvbuf(stdin, NULL, _IONBF, 0);
	xil_printf("\n\r");

	xil_printf("Key (hex): ");
	for(int i = 0; i < 16; i++)
	{
		xil_printf("%02x ",*(baseaddr_p+i));
	}
	xil_printf("\n\r");
    xil_printf("Plain Text (hex): ");
	for(int i = 16; i < 32; i++)
	{
		xil_printf("%02x ",*(baseaddr_p+i));
	}
	xil_printf("\n\r");
	xil_printf("Cipher Text (hex): ");
	for(int i = 47; i > 31; i--)
	{
		xil_printf("%02x ",*(baseaddr_p+i));
	}
	xil_printf("\n\r");
	xil_printf("End of test\n\n\r");

	return 0;
}
