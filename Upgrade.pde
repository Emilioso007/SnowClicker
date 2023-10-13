class Upgrade {

  int x, y, w, h;
  String text;
  float extraPerSecond;
  float price, priceIncrease;

  int amountBought = 0;

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
    fill(128, score>=price?200:0, 0);
    rect(x, y, w, h);
    fill(255);
    textSize(20);
    textAlign(CENTER, TOP);
    text(text, x+w/2, y+5);
    textAlign(LEFT, CENTER);
    text("\n$$$:\n$/s:\nQty:", x+5, y+h/2.0);
    textAlign(RIGHT, CENTER);
    text("\n" + int(price) + "\n" + extraPerSecond + "\n" + amountBought, x+w-5, y+h/2.0);
  }

  boolean contains(int x_, int y_) {

    return (x_ >= x && x_ <= x+w && y_ >= y && y_ <= y+h);
  }
}
