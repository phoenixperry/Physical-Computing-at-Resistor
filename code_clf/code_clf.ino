/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.
 
  This example code is in the public domain.
 */
 
// Pin 13 has an LED connected on most Arduino boards.
// Pin 11 has the LED on Teensy 2.0
// Pin 6  has the LED on Teensy++ 2.0
// Pin 13 has the LED on Teensy 3.0
// give it a name:
int led = 10;
int btn = 13;
int pressed = 1; 

// the setup routine runs once when you press reset:
void setup() {   
  Serial.begin(9600);  
  // initialize the digital pin as an output.
  pinMode(led, OUTPUT); 
  //when btn is pressed val is 0 and 1 is idle. 
   pinMode(btn, INPUT);   
  
}

//int bright;

// the loop routine runs over and over again forever:
void loop() {
  
  pressed = digitalRead(btn);
  //Serial.println(pressed);
  if(pressed==LOW){ 
    analogWrite(led, LOW);
    Serial.write(pressed); 
   delay(100);  
  }   
  // turn the LED on (HIGH is the   voltage level)
  //delay(1000);               // wait for a second
  else{

    analogWrite(led, HIGH);    // turn the LED off by making the voltage LOW
 // delay(1000); 
    Serial.println(0); 
    delay(100);  
    //Serial.write(pressed);
    }
  // wait for a second
}
