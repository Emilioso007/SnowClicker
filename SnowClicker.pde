import processing.sound.*;
import java.text.NumberFormat;
import java.util.*;

SoundFile clickSound, buySound, ascendSound;

Upgrade[] upgrades;

Snow snow;

float score, scorePerSecond, clickPower;

float globalMult = 1;

ClickUpgrade clickUpgrade;

AscendUpgrade ascendUpgrade;

PFont font;

PGraphics upgradePanel;
final PVector upgradePanelPos = new PVector(0, 0);

NumberFormat fmt;

void setup() {
  size(800, 560);

  score = 0;
  scorePerSecond = 0;
  clickPower = 100;

  upgradePanel = createGraphics((int)(width*0.225), height);

  fmt = NumberFormat.getCompactNumberInstance(Locale.US, NumberFormat.Style.SHORT);

  clickSound = new SoundFile(this, "snow.mp3");
  buySound = new SoundFile(this, "buy.wav");
  ascendSound = new SoundFile(this, "ascend.wav");

  clickUpgrade = new ClickUpgrade(width-40, height/2-80, 20, 160, 20, 1.3);

  ascendUpgrade = new AscendUpgrade((int)(width*0.225), height-170, 200, 160);

  upgrades = new Upgrade[5];

  //Upgrade(x, y, w, h, text, sps, price, price_increase)

  String[] upgrade_title = {"Hair Dryer", "Fork", "Rubber Duck", "Snow Gun", "Plasma Press"};
  float[] upgrade_sps = {1, 2, 5, 10, 20};
  float[] upgrade_price = {10, 25, 50, 100, 200};
  float[] upgrade_price_increase = {1.1, 1.15, 1.2, 1.25, 1.3};

  for (int i = 0; i < upgrade_sps.length; i++) {
    upgrade_sps[i] *= globalMult;
  }

  for (int i = 0; i < upgrades.length; i++) {
    upgrades[i] = new Upgrade(
      //x
      upgradePanel.width/2,
      //y
      (int)((upgradePanel.height/upgrades.length)/2+(upgradePanel.height/upgrades.length)*i),
      //w
      upgradePanel.width,
      //h
      (int)(upgradePanel.height/upgrades.length),
      //title
      upgrade_title[i],
      //snowballs per second
      upgrade_sps[i],
      //price
      upgrade_price[i],
      //price increase multiplier
      upgrade_price_increase[i],
      //graphic element
      upgradePanel,
      //graphic position
      upgradePanelPos
      );
  }

  frameRate(60);
  font = createFont("Source Code Pro Regular", 32);
  textFont(font);

  snow = new Snow(5*width/8, 2*height/3, 160, 160);
}

void draw() {

  score += scorePerSecond * 1/60.0;

  background(0);

  for (Upgrade u : upgrades) {
    u.show();
  }
  imageMode(CORNER);
  image(upgradePanel, upgradePanelPos.x, upgradePanelPos.y);

  snow.show();

  clickUpgrade.update();
  clickUpgrade.show();

  if (upgrades[upgrades.length-1].amountBought!=0)ascendUpgrade.show();

  fill(255);
  textAlign(CENTER, TOP);

  textSize(60);
  text(fmt.format(int(score)) + " snowball" + (int(score)!=1?"s":""), 5*width/8, 30);
  textSize(25);
  text(int(scorePerSecond) + "." + int((scorePerSecond%1)*100) + " snowballs per second", 5*width/8, 100);

  textSize(12);
  textAlign(RIGHT, TOP);
  String fps = String.format(Locale.US, "%.2f", frameRate);
  text("FPS: " + fps, width-1, 0+1);

  if (globalMult > 1) {
    textSize(20);
    textAlign(RIGHT, BOTTOM);
    text("Current permanent multiplier: " + (int)globalMult, width-10, height-10);
  }
}

void mousePressed() {

  if (snow.contains(mouseX, mouseY)) {
    score += clickPower;
    clickUpgrade.clickCount++;
    clickSound.stop();
    clickSound.play();
  } else {

    for (int i = 0; i < upgrades.length; i++) {
      if (upgrades[i].contains(mouseX, mouseY) && score >= upgrades[i].price) {
        score -= upgrades[i].price;
        scorePerSecond += upgrades[i].extraPerSecond;
        upgrades[i].price *= upgrades[i].priceIncrease;
        upgrades[i].amountBought++;
        buySound.stop();
        buySound.play();
      }
    }
  }
  if (ascendUpgrade.contains(mouseX, mouseY) && upgrades[upgrades.length-1].amountBought>=10) {
    globalMult *= 2;
    ascendSound.stop();
    ascendSound.play();
    reset();
  }
}

void reset() {

  frameCount = -1;
}
