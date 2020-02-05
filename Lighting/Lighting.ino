

int Power;
void setup() {
pinMode(7, OUTPUT);
pinMode(5, INPUT);
}

void loop() {
    Power=digitalRead(5);
    if (Power == 0){
      digitalWrite(LED_BUILTIN, HIGH);
    }
    else{
      digitalWrite(LED_BUILTIN, LOW);
    }
    delay(250);
}
