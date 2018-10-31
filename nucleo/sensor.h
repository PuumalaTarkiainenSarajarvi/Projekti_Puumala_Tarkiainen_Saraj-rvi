#include <mbed.h>

class Sensor
{
public:
  Sensor();
  bool getMotionStatus();
private:
  DigitalIn motionIn;
  bool motionIsUp;
};
