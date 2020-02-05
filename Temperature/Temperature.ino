void setup() {
pinMode(LED_BUILTIN,OUTPUT);
pinMode(7, OUTPUT);
pinMode(6, OUTPUT);
int SensorAvg;
}

void loop() {
  int Sensor1=analogRead(A0);
  int Sensor2=analogRead(A1);
  int Sensor3=analogRead(A2);
  if (Sensor1>210 || Sensor2>210 || Sensor3>210){
    digitalWrite(7, HIGH);
  }
  else {
    digitalWrite(7, LOW);
  }
  int SensorAvg=(Sensor1+Sensor2+Sensor3)/3;
  analogWrite(6, SensorAvg);
  delay(500);
}
