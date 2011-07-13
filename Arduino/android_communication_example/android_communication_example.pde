#include <SPI.h>

#include <Adb.h>
#define MAX_RESET 8



// Adb connection.
Connection * connection;

// Elapsed time for ADC sampling
long lastTime;
boolean r = true;
// Event handler for the shell connection. 
void adbEventHandler(Connection * connection, adb_eventType event, uint16_t length, uint8_t * data)
{
  int i;

  // Data packets contain two bytes, one for each servo, in the range of [0..180]
  if (event == ADB_CONNECTION_RECEIVE)
  {
   r = !r;
    analogWrite(3,data[0]);
  }
 

}

void setup()
{
 
 pinMode(3, OUTPUT);
  // Initialise serial port
  Serial.begin(57600);
  
  // Note start time
  lastTime = millis();


  // Initialise the ADB subsystem.  
  ADB::init();

  // Open an ADB stream to the phone's shell. Auto-reconnect
  connection = ADB::addConnection("tcp:4567", true, adbEventHandler);  
}
int value = 0;
void loop()
{
 
  
  if ((millis() - lastTime) > 20)
  {
    value = value + 1;
    uint16_t data = 50;//analogRead(A0);
    connection->write(2, (uint8_t*)&data);
    lastTime = millis();
  //  Serial.println("sdf");
  }

  // Poll the ADB subsystem.
  ADB::poll();
}

