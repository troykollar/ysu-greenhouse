int Power;                            //Declare variable that will hold the photoresistor level
void setup() {
pinMode(12, OUTPUT);                  //Set which pin will output to control relay 1
pinMode(11, OUTPUT);                  //Set which pin will output to control relay 2
Serial.begin(9600);                   //Setup serial comms with baud rate of 9600
}

void loop() {
    Power=analogRead(A0);             //Read Photoresistor value
    Serial.print(Power);              //Print the value
    Serial.print("   ");
    
    if (Power < 700){                 //Sets darkness threshold to turn the lights on
      digitalWrite(12, HIGH);         //Turns relay 1 on
      digitalWrite(11, HIGH);         //Turns realy 2 on
      delay(2000);                    //Keep the lights on for 2 sec
      digitalWrite(12, LOW);          //Turn relay 1 off
      delay(1500);                    //Wait 1.5sec
      digitalWrite(11, LOW);          //Turn relay 2 off
    }
}
