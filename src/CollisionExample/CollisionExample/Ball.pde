// ========================
// COMMON CLASSES (used by both examples)
// ========================

class Ball {
  float x, y, r;
  
  Ball(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }
  
  // Returns true if this ball collides with the player
  boolean intersects(Player p) {
    return dist(x, y, p.x, p.y) < r + p.r;
  }
  
  // Optional: ball-ball intersection
  boolean intersects(Ball other) {
    return dist(x, y, other.x, other.y) < r + other.r;
  }
  
  void display() {
    fill(255, 0, 0);
    noStroke();
    ellipse(x, y, r*2, r*2);
  }
}
