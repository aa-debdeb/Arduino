import processing.serial.*;

Serial serial;

void setup(){
  size(500,200);
  stroke(128);
  strokeWeight(1);
  serial = new Serial(this, "/dev/tty.usbmodem1411", 9600);
}

void draw(){
  background(255);
  line(mouseX, 0, mouseX, height);
  serial.write(int(map(mouseX, 0, width, 0, 255)));
}