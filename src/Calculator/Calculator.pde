// Jamie Duersch | Oct 10 | Calculator

Button[] buttons = new Button[13];
Button[] numButtons = new Button[10];
float l, r, result;
String dVal;
String op;
boolean left;

void setup() {
  size(200, 300);
  background(0);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  dVal = "0";
  op = "";
  left = true;

  // Function Buttons
  buttons[0] = new Button(25, 65, 30, 30, "+/-", #FFFFFF, #AAAAAA);
  buttons[1] = new Button(65, 65, 30, 30, "rnd", #FFFFFF, #AAAAAA);
  buttons[2] = new Button(105, 65, 30, 30, "^", #FFFFFF, #AAAAAA);
  buttons[3] = new Button(25, 105, 30, 30, "√", #FFFFFF, #AAAAAA);
  buttons[4] = new Button(65, 105, 30, 30, "π", #FFFFFF, #AAAAAA);
  buttons[5] = new Button(105, 105, 30, 30, "del", #FFFFFF, #AAAAAA);
  buttons[6] = new Button(170, 105, 30, 30, "*", #FFFFFF, #AAAAAA);
  buttons[7] = new Button(170, 65, 30, 30, "/", #FFFFFF, #AAAAAA);
  buttons[8] = new Button(170, 145, 30, 30, "-", #FFFFFF, #AAAAAA);
  buttons[9] = new Button(170, 185, 30, 30, "+", #FFFFFF, #AAAAAA);
  buttons[10] = new Button(105, 265, 30, 30, ".", #FFFFFF, #AAAAAA);
  buttons[11] = new Button(170, 245, 30, 70, "=", #FFFFFF, #AAAAAA);
  buttons[12] = new Button(25, 265, 30, 30, "C", #FFFFFF, #AAAAAA);

  // Number Buttons
  numButtons[9] = new Button(105, 145, 30, 30, "9", #FFFFFF, #AAAAAA);
  numButtons[8] = new Button(65, 145, 30, 30, "8", #FFFFFF, #AAAAAA);
  numButtons[7] = new Button(25, 145, 30, 30, "7", #FFFFFF, #AAAAAA);
  numButtons[6] = new Button(105, 185, 30, 30, "6", #FFFFFF, #AAAAAA);
  numButtons[5] = new Button(65, 185, 30, 30, "5", #FFFFFF, #AAAAAA);
  numButtons[4] = new Button(25, 185, 30, 30, "4", #FFFFFF, #AAAAAA);
  numButtons[3] = new Button(105, 225, 30, 30, "3", #FFFFFF, #AAAAAA);
  numButtons[2] = new Button(65, 225, 30, 30, "2", #FFFFFF, #AAAAAA);
  numButtons[1] = new Button(25, 225, 30, 30, "1", #FFFFFF, #AAAAAA);
  numButtons[0] = new Button(65, 265, 30, 30, "0", #FFFFFF, #AAAAAA);
}

void draw() {
  background(50);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed() {
  println("Key:" + key);
  println("Key Code:" + keyCode);
  if (keyCode == 8 ) {       // Numpad backspace
    left = false;
    dVal = "0";
  } else if (keyCode == 67) {       // Numpad C
    left = false;
    dVal = "0";
  } else if (keyCode == 107) {       // Numpad +
    op = "+";
    left = false;
    dVal = "0";
  } else if (keyCode == 109 || keyCode == 189) {  // Numpad -
    op = "-";
    left = false;
    dVal = "0";
  } else if (keyCode == 106 || keyCode == 88) {  // Numpad *
    op = "*";
    left = false;
    dVal = "0";
  } else if (keyCode == 111) {  // Numpad /
    op = "/";
    left = false;
    dVal = "0";
  } else if (keyCode == 61 || keyCode == 187) {  // = or Enter
    performCalculation();
    left = true;
    l = result;
  } else if (keyCode == 110) {  // Numpad decimal
    if (!dVal.contains(".")) dVal += ".";
  } else if (keyCode == 80) {   // P key for π
    if (left) l = PI;
    else r = PI;
    dVal = str(PI);
  } else if (keyCode == 82) {   // R key for rnd
    float temp = round(float(dVal));
    dVal = str(temp);
    if (left) l = temp;
    else r = temp;
  } else if (keyCode == 33 || keyCode == 38) { // Page Up / Up Arrow for ^
    op = "^";
    left = false;
    dVal = "0";
  } else if (keyCode == 78) {   // N key for +/-
    float temp = float(dVal) * -1;
    dVal = str(temp);
    if (left) l = temp;
    else r = temp;
  } else if (keyCode == 34 || keyCode == 40) { // Page Down / Down Arrow for √
    float temp = sqrt(float(dVal));
    dVal = str(temp);
    if (left) l = temp;
    else r = temp;
  }

  else if (keyCode == 48 || keyCode == 96) {
    if (dVal.length()<17) {
        if (left == true) {
            if (dVal.equals("0")) {
                dVal = "0";
                l = float(dVal);
            } else {
                dVal += "0";
                l = float(dVal);
            }
        } else if (!left)
          if (dVal.equals("0")) {
            dVal = "0";
            r = float(dVal);
          } else {
            dVal += "0";
            r = float(dVal);
          }
      }
  }
  else if (keyCode == 49 || keyCode == 97) {
    if (dVal.length()<17) {
        if (left == true) {
            if (dVal.equals("0")) {
                dVal = "1";
                l = float(dVal);
            } else {
                dVal += "1";
                l = float(dVal);
            }
        } else if (!left)
          if (dVal.equals("0")) {
            dVal = "1";
            r = float(dVal);
          } else {
            dVal += "1";
            r = float(dVal);
          }
      }
  }
  else if (keyCode == 50 || keyCode == 98) {
    if (dVal.length()<17) {
        if (left == true) {
            if (dVal.equals("0")) {
                dVal = "2";
                l = float(dVal);
            } else {
                dVal += "2";
                l = float(dVal);
            }
        } else if (!left)
          if (dVal.equals("0")) {
            dVal = "2";
            r = float(dVal);
          } else {
            dVal += "2";
            r = float(dVal);
          }
      }
  }
  else if (keyCode == 51 || keyCode == 99) {
    if (dVal.length()<17) {
        if (left == true) {
            if (dVal.equals("0")) {
                dVal = "3";
                l = float(dVal);
            } else {
                dVal += "3";
                l = float(dVal);
            }
        } else if (!left)
          if (dVal.equals("0")) {
            dVal = "3";
            r = float(dVal);
          } else {
            dVal += "3";
            r = float(dVal);
          }
      }
  }
  else if (keyCode == 52 || keyCode == 100) {
    if (dVal.length()<17) {
        if (left == true) {
            if (dVal.equals("0")) {
                dVal = "4";
                l = float(dVal);
            } else {
                dVal += "4";
                l = float(dVal);
            }
        } else if (!left)
          if (dVal.equals("0")) {
            dVal = "4";
            r = float(dVal);
          } else {
            dVal += "4";
            r = float(dVal);
          }
      }
  }
  else if (keyCode == 53 || keyCode == 101) {
    if (dVal.length()<17) {
        if (left == true) {
            if (dVal.equals("0")) {
                dVal = "5";
                l = float(dVal);
            } else {
                dVal += "5";
                l = float(dVal);
            }
        } else if (!left)
          if (dVal.equals("0")) {
            dVal = "5";
            r = float(dVal);
          } else {
            dVal += "5";
            r = float(dVal);
          }
      }
  }
  else if (keyCode == 54 || keyCode == 102) {
    if (dVal.length()<17) {
        if (left == true) {
            if (dVal.equals("0")) {
                dVal = "6";
                l = float(dVal);
            } else {
                dVal += "6";
                l = float(dVal);
            }
        } else if (!left)
          if (dVal.equals("0")) {
            dVal = "6";
            r = float(dVal);
          } else {
            dVal += "6";
            r = float(dVal);
          }
      }
  }
  else if (keyCode == 55 || keyCode == 103) {
    if (dVal.length()<17) {
        if (left == true) {
            if (dVal.equals("0")) {
                dVal = "7";
                l = float(dVal);
            } else {
                dVal += "7";
                l = float(dVal);
            }
        } else if (!left)
          if (dVal.equals("0")) {
            dVal = "7";
            r = float(dVal);
          } else {
            dVal += "7";
            r = float(dVal);
          }
      }
  }
  else if (keyCode == 56 || keyCode == 104) {
    if (dVal.length()<17) {
        if (left == true) {
            if (dVal.equals("0")) {
                dVal = "8";
                l = float(dVal);
            } else {
                dVal += "8";
                l = float(dVal);
            }
        } else if (!left)
          if (dVal.equals("0")) {
            dVal = "8";
            r = float(dVal);
          } else {
            dVal += "8";
            r = float(dVal);
          }
      }
  }
    else if (keyCode == 57 || keyCode == 105) {
    if (dVal.length()<17) {
        if (left == true) {
            if (dVal.equals("0")) {
                dVal = "9";
                l = float(dVal);
            } else {
                dVal += "9";
                l = float(dVal);
            }
        } else if (!left)
          if (dVal.equals("0")) {
            dVal = "9";
            r = float(dVal);
          } else {
            dVal += "9";
            r = float(dVal);
          }
      }
  }
    if (left) l = float(dVal);
    else r = float(dVal);
  }

void mousePressed() {
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].over) {
      if (dVal.equals("0")) dVal = numButtons[i].val;
      else dVal += numButtons[i].val;

      if (left) l = float(dVal);
      else r = float(dVal);
    }
  }
}

void mouseReleased() {
  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].over && buttons[i].val.equals("C")) {
      l = r = result = 0;
      dVal = "0";
      op = "";
      left = true;
    } 
    else if (buttons[i].over && buttons[i].val.equals("del")) {
      if (dVal.length() > 1) dVal = dVal.substring(0, dVal.length() - 1);
      else dVal = "0";
      if (left) l = float(dVal);
      else r = float(dVal);
    } 
    else if (buttons[i].over && buttons[i].val.equals("+")) {
      op = "+";
      left = false;
      dVal = "0";
    } 
    else if (buttons[i].over && buttons[i].val.equals("-")) {
      op = "-";
      left = false;
      dVal = "0";
    } 
    else if (buttons[i].over && buttons[i].val.equals("*")) {
      op = "*";
      left = false;
      dVal = "0";
    } 
    else if (buttons[i].over && buttons[i].val.equals("/")) {
      op = "/";
      left = false;
      dVal = "0";
    } 
    else if (buttons[i].over && buttons[i].val.equals("^")) {
      op = "^";
      left = false;
      dVal = "0";
    } 
    else if (buttons[i].over && buttons[i].val.equals("=")) {
      performCalculation();
      left = true;
      l = result;
    } 
    else if (buttons[i].over && buttons[i].val.equals("+/-")) {
      float temp = float(dVal) * -1;
      dVal = str(temp);
      if (left) l = temp;
      else r = temp;
    } 
    else if (buttons[i].over && buttons[i].val.equals("rnd")) {
      float temp = round(float(dVal));
      dVal = str(temp);
      if (left) l = temp;
      else r = temp;
    } 
    else if (buttons[i].over && buttons[i].val.equals("√")) {
      float temp = sqrt(float(dVal));
      dVal = str(temp);
      if (left) l = temp;
      else r = temp;
    } 
    else if (buttons[i].over && buttons[i].val.equals("π")) {
      if (left) l = PI;
      else r = PI;
      dVal = str(PI);
    } 
    else if (buttons[i].over && buttons[i].val.equals(".")) {
      if (!dVal.contains(".")) dVal += ".";
    }
  }

  println("l: " + l);
  println("r: " + r);
  println("result: " + result);
  println("left: " + left);
  println("op: " + op);
}

void updateDisplay() {
  rectMode(CORNER);
  fill(255);
  rect(10, 10, 175, 30, 5);
  fill(0);
  textSize(20);
  textAlign(RIGHT, CENTER);
  text(dVal, width - 20, 25);
}

void performCalculation() {
  if (op.equals("+")) result = l + r;
  else if (op.equals("-")) result = l - r;
  else if (op.equals("*")) result = l * r;
  else if (op.equals("/")) result = (r != 0) ? l / r : 0;
  else if (op.equals("^")) result = pow(l, r);

  dVal = str(result);
  l = result;
  left = true;
}
