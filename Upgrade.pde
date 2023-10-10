class Upgrade {

  int x, y, w, h;
  String text;
  float extraPerSecond;
  float price, priceIncrease;

  Upgrade(int x_, int y_, int w_, int h_, String text_, float extraPerSecond_, float price_, float priceIncrease_) {

    x = x_;
    y = y_;
    w = w_;
    h = h_;
    text = text_;
    extraPerSecond = extraPerSecond_;
    price = price_;
    priceIncrease = priceIncrease_;
  }

  void show() {

    rectMode(CORNER);
    noStroke();
    fill(128, 200, 0);
    rect(x, y, w, h);
    fill(255);
    textSize(20);
    textAlign(LEFT, CENTER);
    text(text + "\nPrice: " + int(price) + "\nSPS: " + extraPerSecond, x+10, y+h/2.0);
  }
}
