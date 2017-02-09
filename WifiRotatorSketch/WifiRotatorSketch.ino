#include <EEPROM.h>
#include <Servo.h>

extern "C"
{
#include "uart_command_lib.h"
#include "corbomite.h"
}

typedef struct{
	int16_t value;
	int16_t a;
} iir_state_int16_t;

uint16_t azimuth = 10;
uint16_t elevation = 69;


extern "C" {

void setAzimuth(int32_t d){ azimuth=d;}
void setElevation(int32_t d){ elevation=d;}

ANA_OUT("elevation", "deg", "-5", "30", 69, 110, setElevation, elevationWidget);
ANA_OUT("azimuth", "deg", "-90", "90", 10, 160, setAzimuth, azimuthWidget);

const CorbomiteEntry last PROGMEM = {LASTTYPE, "", 0};
const EventData initEvent PROGMEM = {registeredEntries};

const CorbomiteEntry initcmd PROGMEM = 
	{EVENT_OUT, internalId, (CorbomiteData*)&initEvent};

const CorbomiteEntry * const entries[] PROGMEM = {
	&elevationWidget,
	&azimuthWidget,
	&initcmd, &last
};

} //extern "C"
Servo azimuthServo;
Servo elevationServo;


void setup()
{
  Serial.begin(9600);
  azimuthServo.attach(9);
  elevationServo.attach(10);
}

void loop()
{
	azimuthServo.write(azimuth);
	elevationServo.write(elevation);
	delay(20);
	commandLine();
}

void platformSerialWrite(const char *buf, uint16_t len)
{
    Serial.write((uint8_t *)buf, len);
}

void serialEvent()
{
    while(Serial.available()){
        addCharToBuffer(Serial.read());
    }
}
 
