//axis aligned bounding box

class AABB {

  int x, y, w, h;

  int xTrans = 0, yTrans = 0;

  AABB(int x_, int y_, int w_, int h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }

  AABB(int x_, int y_, int w_, int h_, int xTrans_, int yTrans_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    xTrans = xTrans_;
    yTrans = yTrans_;
  }

  boolean contains(int x_, int y_) {
    return(x_ >= x+xTrans && x_ <= x+xTrans+w && y_ >= y+yTrans && y_ <= y+yTrans+h);
  }
}
