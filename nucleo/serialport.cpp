#include "serialport.h"

SerialPort::SerialPort() : pc(USBTX,USBRX)
{

}

void SerialPort::printSerial(string message)
{
  pc.printf("1");
}
