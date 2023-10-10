
Snow snow;

float score = 0, scorePerSecond = 2, clickPower = 1;

PFont font;

void setup() {
  frameRate(60);
  font = createFont("Source Code Pro Regular", 32);
  
  size(640, 480);
  snow = new Snow(width/2,2*height/3, 160,160);
}

void draw() {
  
  score += scorePerSecond * 1/60.0;
  
  background(0);
  
  snow.show();
  
  textAlign(CENTER,TOP);
  textSize(60);
  textFont(font);
  text(int(score), width/2, 10);
  text(int(scorePerSecond) + "." + int((scorePerSecond%1)*100), width/2, 50);
  
}

void mousePressed(){
 
  if(snow.contains(mouseX,mouseY)){
   
    score += clickPower;
    
  }
  
}
