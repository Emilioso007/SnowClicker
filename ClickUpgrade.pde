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
    rect(x, y, w, h);
    fill(78, 175, 58);
    int value = (int)map(clickCount, 0, target, 0, h);
    rect(x, y+(h-value), w, value);

    textAlign(RIGHT, TOP);
    textSize(16);
    text("Clickpower:\n" + int(clickPower*100)/100.0, x+w, y+h+10);
  }
}
