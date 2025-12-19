ArrayList<Ball> barriers;
Player player;

void setup() {
  size(800, 600);
  player = new Player(width/2, height-50, 25);
  
  barriers = new ArrayList<Ball>();
  // Place some solid barrier balls
  barriers.add(new Ball(400, 300, 60));
  for (int i = 0; i < 12; i++) {
    barriers.add(new Ball(random(100, width-100), random(100, height-100), 35));
  }
}

void draw() {
  background(240);
  
  // Store position before movement (for collision resolution)
  float prevX = player.x;
  float prevY = player.y;
  
  // Player movement (WASD)
  if (keyPressed) {
    if (key == 'w' || key == 'W') player.y -= player.speed;
    if (key == 's' || key == 'S') player.y += player.speed;
    if (key == 'a' || key == 'A') player.x -= player.speed;
    if (key == 'd' || key == 'D') player.x += player.speed;
  }
  
  // Keep inside window
  player.x = constrain(player.x, player.r, width  - player.r);
  player.y = constrain(player.y, player.r, height - player.r);
  
  // Collision resolution – revert movement if we intersect any barrier
  for (Ball b : barriers) {
    if (b.intersects(player)) {
      player.x = prevX;   // cancel this frame's movement
      player.y = prevY;
      break;              // one correction per frame is enough
    }
  }
  
  // Draw everything
  for (Ball b : barriers) {
    b.display();
  }
  player.display();
  
  fill(0);
  textSize(16);
  text("WASD to move – red circles are solid barriers", 20, 30);
}
