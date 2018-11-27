#include <mbed.h>

#include "sensor.h"
#include "serialport.h"
#include "tempsensor.h"

#define STATUS_MAGNET_ON 1
#define STATUS_MAGNET_OFF 2

#define MESSAGE_MOTION 1
#define MESSAGE_MAGNET_ON 2
#define MESSAGE_MAGNET_OFF 3

int tempTimerStatus;

void enableTemperature()
{
  tempTimerStatus = 1;
}

int main()
{
  Serial pc(USBTX,USBRX);

  Ticker tempTimer;

  Sensor* sensor = new Sensor;
  TempSensor tempSensor;

  SerialPort* serialPort = new SerialPort;

  int magnetStatus;

  tempTimer.attach(&enableTemperature, 3600.0);

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

    if(tempTimerStatus == 1)
    {
      double temp = tempSensor.getTemperature();
      serialPort->printTemp(temp);

      tempTimerStatus = 0;
    }
    wait (0.1);
	}
}
