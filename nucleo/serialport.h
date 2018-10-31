#include <mbed.h>
#include <string>

class SerialPort
{
public:
  SerialPort();
  void printSerial(string message);
private:
  Serial pc;
};
