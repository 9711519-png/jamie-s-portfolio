int level = 1;
float timeLeft = 5;

void setup() {
    size(600,1000);
    textAlign(CENTER);
    textSize(40);
}

void draw() {
   background(40);
   timeLeft = timeLeft - 1.0/60;
  if(timeLeft <= 0) {
    level++;
    timeLeft = 5;
  }
  fill(255);
  text("Level: " + level,width/2,500);
  
  text("Next level in: " + nf(timeLeft,1,1) + "s",width/2, 450);
  
}
