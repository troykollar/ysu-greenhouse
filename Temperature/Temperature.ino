int state=1;                                              //This is the initial state value
int numstates=10;                                         //This is the number of readings you'll average together
int tpa=0;                                                //This is the temperature of taking the average of numstates number of points  ie if numstates=10 youre taking a ten point average
int temps[10];                                            //This is the array that temporarily stores the ten temps we will average
int cycle=1;
void setup() {
pinMode(LED_BUILTIN,OUTPUT);
pinMode(7, OUTPUT);
pinMode(6, OUTPUT);
Serial.begin(9600);
}

void loop() {
  int Sensor1=analogRead(A0);                             //Reads Sensor 1 Data
  int Sensor2=analogRead(A1);                             //Reads Sensor 2 Data
  int Sensor3=analogRead(A2);                             //Reads Sensor 3 Data
  
  int ActS1=RealTemp(Sensor1);                            //Converting ADC value to real temp in farenheit for Sensor 1
  int ActS2=RealTemp(Sensor2);                            //Converting ADC value to real temp in farenheit for Sensor 2
  int ActS3=RealTemp(Sensor3);                            //Converting ADC value to real temp in farenheit for Sensor 3
  
  int SensorAvg=(Sensor1+Sensor2+Sensor3)/3;              //Taking the ADC average Value, this is what outputted in the DAC
  TempPrint(ActS1,ActS2,ActS3);                           //This gives us the real average temp in farenheit
  if (Sensor1>1000){// || Sensor2>210 || Sensor3>210){
    digitalWrite(7, HIGH);
  }
  else {
    digitalWrite(7, LOW);
  }
  analogWrite(6, SensorAvg);
  delay(50);
}

int RealTemp(int x){
  if(x>=100 && x<125)
  return 50;
  else if(x>=125 && x<127)
  return 55;
  else if(x>=127 && x<130)
  return 60;
  else if(x>=130 && x<133)
  return 65;
  else if(x>=133 && x<135)
  return 70;
  else if(x>=135 && x<137)
  return 75;
  else if(x>=137 && x<140)
  return 80;
  else if(x>=140 && x<143)
  return 85;
  else if(x>=143 && x<145)
  return 90;
  else if(x>=145 && x<147)
  return 95;
  else if(x>=147 && x<150)
  return 100;
  else if(x>=165 && x<170)
  return 100;
  else if(x>=170 && x<175)
  return 105;
  else if(x>=175 && x<180)
  return 110;
  
}
void TempPrint(int x, int y, int z){
  if(state==(numstates)){
    for(int i=1;i<numstates;i++){
      tpa=tpa+temps[i];
    }
    tpa=tpa/(numstates-1);
    Serial.print(tpa);
    Serial.print("   ");
    state=1;
    cycle=1;
    tpa=0;
  }
  temps[state]=(x+y+z)/3;
  state++;
}
