class AscendUpgrade extends AABB {

  AscendUpgrade(int x_, int y_, int w_, int h_) {
    super(x_, y_, w_, h_);
  }
  
  void show(){
   
    rectMode(CORNER);
    fill(upgrades[upgrades.length-1].amountBought>=10?255:128);
    rect(x,y,w,h);
    textAlign(CENTER,CENTER);
    textSize(18);
    fill(0);
    text("Buy 10 plasma\n press to ascend.\nAscend deletes all\nprogress but gives\nyou a permanent\nx2 mult.\nthat stacks.", x+w/2,y+h/2);
    
  }
}
