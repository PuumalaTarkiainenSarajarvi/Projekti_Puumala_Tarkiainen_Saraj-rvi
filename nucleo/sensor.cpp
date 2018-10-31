#include "sensor.h"

Sensor::Sensor() : motionIn(D7)
{
  motionIsUp = false;
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
