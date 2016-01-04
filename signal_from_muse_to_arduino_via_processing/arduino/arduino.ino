
int v = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(13, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available() > 0){
    v = Serial.read();
  }
  int ms = map(v, 0, 255, 0, 10);
  digitalWrite(13, HIGH);
  delay(ms);
  digitalWrite(13, LOW);
  delay(10 - ms);
}
