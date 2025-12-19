class Player {
  float x, y, r;
  float speed = 5;
  
  Player(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }
  
  void display() {
    fill(0, 100, 255);
    noStroke();
    ellipse(x, y, r*2, r*2);
  }
}
