#define DX 12

void mtone(int dx, int hz, unsigned long tm){
  unsigned long t = millis();
  unsigned long ns = (long)500000 / hz;
  while(millis() - t < tm){
    digitalWrite(dx, HIGH);
    delayMicroseconds(ns);
    digitalWrite(dx, LOW);
    delayMicroseconds(ns);  
  } 
}

void setup() {
  // put your setup code here, to run once:
  pinMode(DX, OUTPUT);
}

void loop(){
  float hz = map(analogRead(A0), 0, 1023, 0, 8000);
  mtone(DX, hz, 50);
}
