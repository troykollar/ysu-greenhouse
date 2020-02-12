int Power;
void setup() {
pinMode(12, OUTPUT);
Serial.begin(9600);
}

void loop() {
    Power=analogRead(A0);
    Serial.print(Power);
    Serial.print("   ");
    if (Power < 700){
      digitalWrite(12, HIGH);
      delay(2000);
    }
    else{
      digitalWrite(12, LOW);
    }
    delay(50);
}
