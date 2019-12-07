/*
 Controlling a servo position using a potentiometer (variable resistor)
 by Michal Rinott <http://people.interaction-ivrea.it/m.rinott>

 modified on 8 Nov 2013
 by Scott Fitzgerald
 http://www.arduino.cc/en/Tutorial/Knob

 modified on 6 Dec 2019
 by Zack Pelster
*/

#include <Wire.h>
#include <Servo.h>

#define SLAVE_ADDRESS 0x04

Servo myservo;  // create servo object to control a servo

int potpin = 0;  // analog pin used to connect the potentiometer
int servopin = 0; // PWM pin used to connect the servo
int past_val, val = 0; // variable to read the value from the analog pin
int past_angle, angle = 0; // hold angle of the servo

void setup() {
  Serial.begin(9600); // start serial for output
  myservo.attach(servopin); // attaches the servo on the specified pin
  
  // initialize i2c as slave
  Wire.begin(SLAVE_ADDRESS);
  
  // define callbacks for i2c communication
  Wire.onReceive(receiveData);
  Wire.onRequest(sendData);
  
  Serial.println("Initialization Complete");
}

void loop() {
  delay(100);
}

// callback for received data
void receiveData(int byteCount){

  while(Wire.available()) {
    past_angle = angle;
    angle = Wire.read();
    if(past_angle != angle){ // prevent the monitor from being overwhelmed
      Serial.print("Angle received: ");
      Serial.println(angle);
    }
    myservo.write(angle); // sets the servo position according to the scaled value
  }
}

// callback for sending data
void sendData(){
  past_val = val;
  val = analogRead(potpin); // reads the value of the potentiometer (value between 0 and 1023)
  if(past_val != val){ // prevent the monitor from being overwhelmed
    Serial.println(val);
  }
  Wire.write(val);
}
