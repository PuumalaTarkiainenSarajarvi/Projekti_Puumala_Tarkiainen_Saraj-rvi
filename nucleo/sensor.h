#include <mbed.h>

class Sensor
{
public:
  Sensor();
  bool getMotionStatus();
  int getMagnetStatus(); // 0 = ei muutosta, 1 = kiinni, 2 = auki
private:
  DigitalIn motionIn;
  DigitalIn magnetIn;
  bool motionIsUp;
  bool magnetPrevStatus;
};
