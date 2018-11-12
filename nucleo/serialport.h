#include <mbed.h>

class SerialPort
{
public:
  SerialPort();
  void printSerial(int message); // 1 = motion, 2 = magnetOn, 3 = magnetOff
private:
  Serial pc;
};
