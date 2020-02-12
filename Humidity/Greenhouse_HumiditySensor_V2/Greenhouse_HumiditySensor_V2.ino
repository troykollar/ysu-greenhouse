//Libraries
#include <DHT.h>

//Constants
#define DHTPIN1 2                            // what pin we're connected to
#define DHTPIN2 4                           // what pin we're connected to
#define DHTPIN3 7                            // what pin we're connected to
#define DHTTYPE DHT22                       // DHT 22  (AM2302)
DHT dht1(DHTPIN1, DHTTYPE);               // Initialize DHT sensor for normal 16mhz Arduino
DHT dht2(DHTPIN2, DHTTYPE);               // Initialize DHT sensor for normal 16mhz Arduino
DHT dht3(DHTPIN3, DHTTYPE);               // Initialize DHT sensor for normal 16mhz Arduino
//Variables
int chk;
float tempCSend;                               //DAC temperature value being sent to the FPGA in C
float tempFSend;                              //DAC temperature value being sent to the FPGA in F
float humSend;                                //DAC humidity value being sent to the FPGA
float hum1;                                  //Stores humidity value
float temp_C1;                               //Stores temperature value
float hum2;                                  //Stores humidity value
float temp_C2;                               //Stores temperature value
float hum3;                                  //Stores humidity value
float temp_C3;                               //Stores temperature value
float temp_F;                               //Stores temp value farenheit
float tempAvg;                              //Average temp of all three sensors
float humAvg;                               //Average humididy of all three sensors


void setup()
{
  pinMode(LED_BUILTIN,OUTPUT);               //Signals to the FPGA if theres any issues
  Serial.begin(9600);                        //Begins serial monitor at 9600 Baud Rate
     dht1.begin();                            //This sets up the sensor
     dht2.begin();                            //This sets up the sensor
     dht3.begin();                            //This sets up the sensor
}

void loop()
{
    delay(3000);                              //Wait 3 seconds
    hum1 = dht1.readHumidity();
    temp_C1= dht1.readTemperature();

    hum2 = dht2.readHumidity();
    temp_C2= dht2.readTemperature();
    
    hum3 = dht3.readHumidity();
    temp_C3= dht3.readTemperature();

    
    //Read data and store it to variables hum and temp
    tempAvg=(temp_C1+temp_C2+temp_C3)/3;
    humAvg=(hum1+hum2+hum3)/3;
    
    if(temp_F<60 || temp_F>120){              //If temperature readings are far from what they should be, send an error to the FPGA
      digitalWrite(7, HIGH);
    }
    tempCSend=DAC_temp(tempAvg);            //Converts farenheit into an integer for the FPGA to read
    tempFSend=tempCSend*1.8+32;                     //Convert celsius to farenheit
    humSend=DAC_hum(humAvg);
    analogWrite(10, tempFSend);
    analogWrite(11, humSend);
    
    
    
    //Print temp and humidity values to serial monitor
    Serial.print("Temp(F): ");
    Serial.print(temp_F);
    Serial.print("   Humidity:");
    Serial.print(humAvg);
    Serial.print("%   Temp DAC:");
    Serial.print(tempFSend);
    Serial.print("   Hum DAC:");
    Serial.println(humSend);
}


float DAC_temp(float x){                            //Converts temp in f to a DAC value between 409-819 (2V-4V)
 float y = (((x+40)/120)*409)+409;
 return y;
}

float DAC_hum(float x){                             //Converts hum in % to a DAC value between 409-819 (2V-4V)
 float y = ((x/100)*409)+409;
 return y;
}
