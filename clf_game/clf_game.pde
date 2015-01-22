import processing.serial.*;

//get the message coming in from Arduino 
Serial myPort; 

//save that incoming value as a varialble 
String val; 

//enemy values 
float enemyx; //xpos on screen 

float enemyy; //ypos on screen 

float enemyRadius; // radius of enemy circle 

int enemySpeed;  // how fast the enemy is going 

int speedLimit;  //control game speed. 

//make it so the whole game can change colors 
color myColor; 

//set up the radius 
int playerRadius; 

//setup some text 
PFont f; 

//set up the score
int score; 


void setup()
{
  // get the port you have coming in - this is usually 7.... we will run some sample code 
  String portName = Serial.list()[7]; 
  
  myPort = new Serial(this, portName, 9600); 
  
  size(1024, 768); 
  val = "0";
  //set up an enemy to fall 
  
  enemyx = random(0+enemyRadius,width-enemyRadius); 
  enemyRadius = random(10,250); 
  enemyy = 0-enemyRadius; 
  enemySpeed =5;  
  speedLimit = 20;
  myColor = color(255,0,0); 
  
  f = loadFont( "Arial-Black-24.vlw" );
  
}

void draw()
{  
    background(0); 

    //draw score 
     textFont(f,24);
     text ("score: " + Integer.toString(score) ,10,40);
     
      //draw Enemy 
      enemyy += enemySpeed; 
      
    //check to see if enemy is off screen and if so reset it 
    if(enemyy > height+enemyRadius){
      //change the fill color  
      fill(random(0,255), 255, random(0,255)); 
      
      //move the enemey off screen 
      enemyy = 0-enemyRadius; 
      enemyx = random(0+enemyRadius, width-enemyRadius);
      
      //see if we've hit the speed limit of the game 
       if(enemySpeed >= speedLimit) 
       {
          enemySpeed = speedLimit;  
       }
       else{
         enemySpeed = enemySpeed +1; 
       }
       
       //change the game's color for fun!  
       myColor = color(random(0,255), random(0,255), 255); 
      //reset player defaults 
    
      //check for score 
      float check  = 0; 
      //check to see if the game is going to get a score or not
      if(playerRadius > enemyRadius)
      {
       check = playerRadius-enemyRadius;  
      }else{
        check= enemyRadius - playerRadius; 
      }
      
      //if the player is within a specific range give them a point  
      println(check);  
     
      if(check < 100) 
      {
        score++; 
      }
      
      //reset the enemy and player radius to default 
      enemyRadius = random(10,250);
      playerRadius = 5; 
      
     }
    //draw the player  
      fill(myColor); 
      ellipse(enemyx, enemyy, enemyRadius, enemyRadius);
    
//  background(0); 
  if(myPort.available() >0) 
  {
    val = myPort.readStringUntil('\n'); 
  }
 
 //button is pressed so make the player larger 
 if(val == null) 
 {
   playerRadius+=5; 
 }
 
 ellipse(width/2, height/2, playerRadius, playerRadius); 
  
} 
