#include <mbed.h>

#include "sensor.h"
#include "serialport.h"

int main()
{
  Sensor* sensor = new Sensor;
  SerialPort* serialPort = new SerialPort;
  int magnetStatus;

  while(1)
  {
    if(sensor->getMotionStatus()) // palauttaa liikahduksen
    {
      serialPort->printSerial(1); // = motion
    }

    magnetStatus = sensor->getMagnetStatus(); // palauttaa tilan muutoksen

    if(magnetStatus == 1)
    {
      serialPort->printSerial(2); // = magnetOn
    }
    else if(magnetStatus == 2)
    {
      serialPort->printSerial(3); // = magnetOff
    }

    wait (0.1);
	}
}
