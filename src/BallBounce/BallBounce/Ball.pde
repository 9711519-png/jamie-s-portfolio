class Ball {
  int x, y, w, h, speed;
  
  Ball(int x, int y) {
    this.x = x;
    this.y = y;
    w = 50;
    h = 50;
    speed = int(random(1, 5));
  }
  
  void display() {
    fill(127);
    ellipse(x, y, w, h);
  }
  
  void move() {
    x = x + speed;
    y = y + speed;
    if(x > width - w/2) {
    speed = speed * -1;
    }
  }
}
