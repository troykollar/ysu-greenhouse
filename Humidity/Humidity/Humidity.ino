/* How to use the DHT-22 sensor with Arduino uno
   Temperature and humidity sensor
   More info: http://www.ardumotive.com/how-to-use-dht-22-sensor-en.html
   Dev: Michalis Vasilakis // Date: 1/7/2015 // www.ardumotive.com */

//Libraries
#include <DHT.h>;

//Constants
#define DHTPIN 2     // what pin we're connected to
#define DHTPIN2 3
#define DHTPIN3 4
#define DHTTYPE DHT22   // DHT 22  (AM2302)
DHT dht(DHTPIN, DHTTYPE); //// Initialize DHT sensor for normal 16mhz Arduino
DHT dht1(DHTPIN2,DHTTYPE);
DHT dht2(DHTPIN3,DHTTYPE);

//Variables
int chk;
float hum, hum1, hum2, humAvg;  //Stores humidity value
float temp, temp1, temp2; //Stores temperature value

void setup()
{
  dht.begin();
  dht1.begin();
  dht2.begin();
  pinMode(7, OUTPUT);
  pinMode(6, INPUT);
}

void loop()
{
    //Read data and store it to variables hum and temp
    hum = dht.readHumidity();
    temp= dht.readTemperature();
    hum1 = dht1.readHumidity();
    temp1= dht1.readTemperature();
    hum2 = dht2.readHumidity();
    temp2= dht2.readTemperature();
    temp=temp*1.8+32;
    temp1=temp1*1.8+32;
    temp2=temp2*1.8+32;
    humAvg=(hum+hum1+hum2)/3;
    if (hum<500 || hum1<500 || hum2<500){
      digitalWrite(7, HIGH);
    }
    else{
      digitalWrite(7, LOW);
    }
    analogWrite(6,humAvg);
    delay(2000); //Delay 2 sec.
}
