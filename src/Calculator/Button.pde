class Button {
int x, y, w, h;
color c1, c2;
String val;
boolean over;

Button(int x, int y, int w, int h, String val, color c1, color c2) {
this.x = x;
this.y = y;
this.w = w;
this.h = h;
this.val = val;
this.c1 = c1;
this.c2 = c2;
over = false;
}

void display() {
rectMode(CENTER);
fill(over ? c2 : c1);
rect(x, y, w, h, 8);
fill(0);
textAlign(CENTER, CENTER);
textSize(13);
text(val, x, y);
}

void hover(int tempX, int tempY) {
over = (tempX > x - w/2 && tempX < x + w/2 && tempY > y - h/2 && tempY < y + h/2);
}
}
