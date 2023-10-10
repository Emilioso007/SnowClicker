
Upgrade[] upgrades;

Snow snow;

float score = 0, scorePerSecond = 0, clickPower = 1;

PFont font;

void setup() {

  upgrades = new Upgrade[5];

  //Upgrade(x, y, w, h, text, sps, price, price_increase)

  upgrades[0] = new Upgrade(10, 0*110+10, 170, 100, "Hair Dryer", 1, 10, 1.1);
  upgrades[1] = new Upgrade(10, 1*110+10, 170, 100, "Fork", 2, 25, 1.15);
  upgrades[2] = new Upgrade(10, 2*110+10, 170, 100, "Rubber Duck", 5, 50, 1.2);
  upgrades[3] = new Upgrade(10, 3*110+10, 170, 100, "Snow Gun", 10, 100, 1.25);
  upgrades[4] = new Upgrade(10, 4*110+10, 170, 100, "Plasma Press", 20, 200, 1.3);


  frameRate(56);
  font = createFont("Source Code Pro Regular", 32);
  textFont(font);

  size(800, 560);
  snow = new Snow(2*width/3, 2*height/3, 160, 160);
}

void draw() {

  score += scorePerSecond * 1/60.0;

  background(0);

  for (Upgrade u : upgrades) {
    u.show();
  }

  snow.show();

  fill(255);
  textAlign(CENTER, TOP);

  textSize(60);
  text(int(score) + " snowball" + (int(score)!=1?"s":""), 2*width/3, 30);
  textSize(25);
  text(int(scorePerSecond) + "." + int((scorePerSecond%1)*100) + " snowballs per second", 2*width/3, 100);
}

void mousePressed() {

  if (snow.contains(mouseX, mouseY)) {
    score += clickPower;
  } else {

    for (int i = 0; i < upgrades.length; i++) {
      if (upgrades[i].contains(mouseX, mouseY) && score >= upgrades[i].price) {

        score -= upgrades[i].price;
        scorePerSecond += upgrades[i].extraPerSecond;
        upgrades[i].price *= upgrades[i].priceIncrease;
        upgrades[i].amountBought++;
      }
    }
  }
}
