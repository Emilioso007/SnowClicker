class ClickUpgrade {

  int x, y, w, h;

  int clickCount = 0, target;
  float clickMulti;

  ClickUpgrade(int x_, int y_, int w_, int h_, int target_, float clickMulti_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    target = target_;
    clickMulti = clickMulti_;
  }

  void update() {

    if (clickCount>=target) {
      clickCount = 0;
      clickPower *= clickMulti;
    }
  }

  void show() {

    rectMode(CORNER);
    fill(80);
    noStroke();
    rect(x, y, w, h);
    fill(78, 175, 58);
    int value = (int)map(clickCount, 0, target-1, 0, h);
    rect(x, y+(h-value), w, value);

    pushMatrix();
    translate(x+w/2, y+h/2);
    rotate(PI/2.0);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(16);
    text("Clickpower: " + int(clickPower*100)/100.0, 0, 0);
    popMatrix();
  }
}
