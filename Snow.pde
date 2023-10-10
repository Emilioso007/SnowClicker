class Snow {

  PImage snowImage;

  int x, y, w, h;

  Snow(int x_, int y_, int w_, int h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    snowImage = loadImage("\\images\\snowImage.png");
    snowImage.resize(w, h);
  }

  boolean contains(int x_, int y_) {

    if (dist(x_, y_, x, y)<=w/2.0) {
      return true;
    }
    return false;
  }

  void show() {

    imageMode(CENTER);
    image(snowImage, x, y);
  }
}
