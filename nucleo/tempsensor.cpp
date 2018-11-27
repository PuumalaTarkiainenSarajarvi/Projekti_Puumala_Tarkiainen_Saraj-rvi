#include "tempsensor.h"

TempSensor::TempSensor() : tempIn(A0)
{
  R = 10000.0;
  U0 = 3.3;
}

double TempSensor::getTemperature()
{
  Ur = tempIn.read();
  Ur = Ur * 3.3;

  rNTC = R * ((U0 / Ur) - 1.0);
  rNTC = rNTC / 1000;

  if(rNTC > RNTC_MAX)
  {
    rNTC = RNTC_MAX;
  }
  else if(rNTC < RNTC_MIN)
  {
    rNTC = RNTC_MIN;
  }

  double temperature = -25.31 * log(rNTC) + 84.229;

  return temperature;
}
