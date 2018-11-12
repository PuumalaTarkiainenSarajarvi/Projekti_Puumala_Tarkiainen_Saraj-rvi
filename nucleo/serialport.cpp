#include "serialport.h"

SerialPort::SerialPort() : pc(USBTX,USBRX)
{

}

void SerialPort::printSerial(int message)
{
  switch(message)
  {
    case 1 :
        pc.printf("motion");
        break;
    case 2 :
        pc.printf("magnetOn");
        break;
    case 3 :
        pc.printf("magnetOff");
        break;
    default :
        break;
  }
}
