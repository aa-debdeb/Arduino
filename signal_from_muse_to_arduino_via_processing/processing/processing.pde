/**
*
* Before running this program,you need to launch 
* MuseIO by below command in your terminal.
* 
* $ muse-io --device Muse-XXXX --osc osc.udp://localhost:5000
*/


import processing.serial.*;
import oscP5.*;

OscP5 oscP5;
Serial serial;

float concentration = 0;

void setup(){
  size(300, 300);
  noStroke();
  fill(255, 20, 147);
  oscP5 = new OscP5(this, 5000);
  serial = new Serial(this, "/dev/tty.usbmodem1411", 9600);
}

void draw(){
  background(64);
  float radious = map(concentration, 0, 1, 50, 300);
  ellipse(width/2, height/2, radious, radious);
  println(concentration);
  serial.write(int(map(concentration, 0, 1, 0, 255)));
}

void oscEvent(OscMessage msg){
  if(msg.checkAddrPattern("/muse/elements/experimental/concentration")){
    concentration = msg.get(0).floatValue();  
  }
}