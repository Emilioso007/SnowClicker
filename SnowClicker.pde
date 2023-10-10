
Upgrade upgrade1;

Snow snow;

float score = 0, scorePerSecond = 0, clickPower = 1;

PFont font;

void setup() {

  upgrade1 = new Upgrade(10, 10, 160, 100, "Upgrade1text", 1, 10, 1.1);

  frameRate(60);
  font = createFont("Source Code Pro Regular", 32);
  textFont(font);

  size(800, 600);
  snow = new Snow(width/2, 2*height/3, 160, 160);
}

void draw() {

  score += scorePerSecond * 1/60.0;

  background(0);

  upgrade1.show();

  snow.show();

  fill(255);
  textAlign(CENTER, TOP);

  textSize(60);
  text(int(score) + " snowball" + (score!=1?"s":""), width/2, 10);
  textSize(25);
  text(int(scorePerSecond) + "." + int((scorePerSecond%1)*100) + " snowballs per second", width/2, 70);
}

void mousePressed() {

  if (snow.contains(mouseX, mouseY)) {

    score += clickPower;
  }
}
