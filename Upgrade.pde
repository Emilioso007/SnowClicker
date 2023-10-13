class Upgrade extends AABB {

  String text;
  float extraPerSecond;
  float price, priceIncrease;

  int amountBought = 0;

  PGraphics world;

  Upgrade(int x_, int y_, int w_, int h_, String text_, float extraPerSecond_, float price_, float priceIncrease_, PGraphics world_, PVector worldTrans_) {
    super(x_-w_/2, y_-h_/2, w_, h_, (int)worldTrans_.x, (int)worldTrans_.y);
    text = text_;
    extraPerSecond = extraPerSecond_;
    price = price_;
    priceIncrease = priceIncrease_;
    world = world_;
  }

  void show() {
    world.beginDraw();

    world.rectMode(CENTER);
    world.stroke(0);
    world.strokeWeight(min(w, h)*0.1);
    world.fill(128, score>=price?200:0, 0);
    world.rect(x+w/2, y+h/2, w, h);

    world.fill(255);
    world.textSize(20);
    world.textAlign(CENTER, TOP);
    world.text(text, x+w/2, y+h*0.1);

    world.textAlign(LEFT, CENTER);
    world.text("\n$$$:\n$/s:\nQty:", x+w*0.05, y+h/2);

    world.textAlign(RIGHT, CENTER);
    world.text("\n" + int(price) + "\n" + extraPerSecond + "\n" + amountBought, x+w-w*0.05, y+h/2);

    world.endDraw();
  }
}
