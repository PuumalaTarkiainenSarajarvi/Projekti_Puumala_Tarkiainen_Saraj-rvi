#include <mbed.h>

#include "sensor.h"
#include "serialport.h"

int main()
{
  Sensor* motionSensor = new Sensor;
  SerialPort* serialPort = new SerialPort;

  while(1)
  {
    if(motionSensor->getMotionStatus())
    {
      serialPort->printSerial("1");
    }
    wait (0.1);
	}
}
