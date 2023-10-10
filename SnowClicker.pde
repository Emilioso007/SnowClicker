
Snow snow;

float score = 0, scorePerSecond = 0, clickPower = 1;

void setup() {
  size(640, 480);
  snow = new Snow(width/2,2*height/3, 160,160);
}

void draw() {
  background(0);
  
  snow.show();
  
  textAlign(CENTER,CENTER);
  textSize(20);
  text(int(score) + "\n" + scorePerSecond, width/2, height/3);
  
}

void mousePressed(){
 
  if(snow.contains(mouseX,mouseY)){
   
    score += clickPower;
    
  }
  
}
