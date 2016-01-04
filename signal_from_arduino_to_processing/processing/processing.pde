import processing.serial.*;

Serial serial;

float diameter = 0;

void setup(){
  size(300, 300);
  noStroke();
  fill(255, 20, 147);
  
  serial = new Serial(this, "/dev/tty.usbmodem1411", 9600);
}

void draw(){
  background(64);
  ellipse(width/2, height/2, diameter, diameter);
}

void serialEvent(Serial p){
  int v = p.read();
  diameter = map(v, 0, 255, 50, 300);
  println(v, diameter);
}