#include <mbed.h>

#include "sensor.h"
#include "serialport.h"

#define STATUS_MAGNET_ON 1
#define STATUS_MAGNET_OFF 2

#define MESSAGE_MOTION 1
#define MESSAGE_MAGNET_ON 2
#define MESSAGE_MAGNET_OFF 3

int main()
{
  Sensor* sensor = new Sensor;
  SerialPort* serialPort = new SerialPort;
  int magnetStatus;

  while(1)
  {
    if(sensor->getMotionStatus()) // palauttaa liikahduksen
    {
      serialPort->printSerial(MESSAGE_MOTION);
    }

    magnetStatus = sensor->getMagnetStatus(); // palauttaa tilan muutoksen

    if(magnetStatus == STATUS_MAGNET_ON)
    {
      serialPort->printSerial(MESSAGE_MAGNET_ON);
    }
    else if(magnetStatus == STATUS_MAGNET_OFF)
    {
      serialPort->printSerial(MESSAGE_MAGNET_OFF);
    }

    wait (0.1);
	}
}
