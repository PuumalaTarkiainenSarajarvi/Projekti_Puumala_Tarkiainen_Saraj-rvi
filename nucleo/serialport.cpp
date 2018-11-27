#include "serialport.h"

SerialPort::SerialPort() : pc(USBTX,USBRX)
{

}

void SerialPort::printSerial(int message)
{
  switch(message)
  {
    case 1 :
        pc.printf("motion\n");
        break;
    case 2 :
        pc.printf("magnetOn\n");
        break;
    case 3 :
        pc.printf("magnetOff\n");
        break;
    default :
        break;
  }
}

void SerialPort::printTemp(double temperature)
{
  pc.printf("%lf\n", temperature);
}
