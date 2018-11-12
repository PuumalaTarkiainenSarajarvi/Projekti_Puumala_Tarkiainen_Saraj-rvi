#include "sensor.h"

Sensor::Sensor() : motionIn(D7), magnetIn(D8)
{
  motionIsUp = false;
  magnetPrevStatus = false;
}

bool Sensor::getMotionStatus()
{
  if(motionIn)
  {
    if(motionIsUp == false)
    {
      motionIsUp = true;
      return true;
    }
    motionIsUp = true;
  }
  else
  {
    motionIsUp = false;
  }
  return false;
}

int Sensor::getMagnetStatus() // 0 = ei muutosta, 1 = kiinni, 2 = auki
{
  if(magnetIn && magnetPrevStatus == false)
  {
    magnetPrevStatus = true;
    return 1;
  }

  if(!magnetIn && magnetPrevStatus == true)
  {
    magnetPrevStatus = false;
    return 2;
  }

  return 0;
}
