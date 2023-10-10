
Upgrade[] upgrades;

Snow snow;

float score = 0, scorePerSecond = 0, clickPower = 1;

PFont font;

void setup() {

  upgrades = new Upgrade[5];

  //Upgrade(x, y, w, h, text, sps, price, price_increase)

  upgrades[0] = new Upgrade(10, 0*110+10, 160, 100, "Upgrade1text", 1, 10, 1.1);
  upgrades[1] = new Upgrade(10, 1*110+10, 160, 100, "Upgrade2text", 10, 100, 1.1);
  upgrades[2] = new Upgrade(10, 2*110+10, 160, 100, "Upgrade3text", 100, 1000, 1.1);
  upgrades[3] = new Upgrade(10, 3*110+10, 160, 100, "Upgrade4text", 1000, 10000, 1.1);
  upgrades[4] = new Upgrade(10, 4*110+10, 160, 100, "Upgrade5text", 10000, 100000, 1.1);


  frameRate(56);
  font = createFont("Source Code Pro Regular", 32);
  textFont(font);

  size(800, 560);
  snow = new Snow(width/2, 2*height/3, 160, 160);
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
  text(int(score) + " snowball" + (score!=1?"s":""), width/2, 10);
  textSize(25);
  text(int(scorePerSecond) + "." + int((scorePerSecond%1)*100) + " snowballs per second", width/2, 70);
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
