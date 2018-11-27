#include <mbed.h>

#define RNTC_MAX 26.8
#define RNTC_MIN 4.1

class TempSensor
{
public:
  TempSensor();
  double getTemperature();
private:
  AnalogIn tempIn;

  double R;
  double U0;
  double Ur;
  double rNTC;
};
