// Jamie Duersch | Oct 10 | Calculator

Button[] buttons = new Button[16];
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
buttons[0] = new Button(25, 65, 30, 30, "+/-", color(#FFFFFF), color(#AAAAAA));
buttons[1] = new Button(65, 65, 30, 30, "rnd", color(#FFFFFF), color(#AAAAAA));
buttons[2] = new Button(105, 65, 30, 30, "^", color(#FFFFFF), color(#AAAAAA));
buttons[3] = new Button(25, 105, 30, 30, "√", color(#FFFFFF), color(#AAAAAA));
buttons[4] = new Button(65, 105, 30, 30, "π", color(#FFFFFF), color(#AAAAAA));
buttons[5] = new Button(105, 105, 30, 30, "del", color(#FFFFFF), color(#AAAAAA));
buttons[6] = new Button(170, 105, 30, 30, "×", color(#FFFFFF), color(#AAAAAA));
buttons[7] = new Button(170, 65, 30, 30, "÷", color(#FFFFFF), color(#AAAAAA));
buttons[8] = new Button(170, 145, 30, 30, "-", color(#FFFFFF), color(#AAAAAA));
buttons[9] = new Button(170, 185, 30, 30, "+", color(#FFFFFF), color(#AAAAAA));
buttons[10] = new Button(105, 265, 30, 30, ".", color(#FFFFFF), color(#AAAAAA));
buttons[11] = new Button(170, 245, 30, 70, "=", color(#FFFFFF), color(#AAAAAA));
buttons[12] = new Button(25, 265, 30, 30, "C", color(#FFFFFF), color(#AAAAAA));
// extra slots to match Ethan's 16 button array
buttons[13] = new Button(0,0,0,0,"", color(0), color(0));
buttons[14] = new Button(0,0,0,0,"", color(0), color(0));
buttons[15] = new Button(0,0,0,0,"", color(0), color(0));

// Number Buttons
numButtons[9] = new Button(105, 145, 30, 30, "9", color(#FFFFFF), color(#AAAAAA));
numButtons[8] = new Button(65, 145, 30, 30, "8", color(#FFFFFF), color(#AAAAAA));
numButtons[7] = new Button(25, 145, 30, 30, "7", color(#FFFFFF), color(#AAAAAA));
numButtons[6] = new Button(105, 185, 30, 30, "6", color(#FFFFFF), color(#AAAAAA));
numButtons[5] = new Button(65, 185, 30, 30, "5", color(#FFFFFF), color(#AAAAAA));
numButtons[4] = new Button(25, 185, 30, 30, "4", color(#FFFFFF), color(#AAAAAA));
numButtons[3] = new Button(105, 225, 30, 30, "3", color(#FFFFFF), color(#AAAAAA));
numButtons[2] = new Button(65, 225, 30, 30, "2", color(#FFFFFF), color(#AAAAAA));
numButtons[1] = new Button(25, 225, 30, 30, "1", color(#FFFFFF), color(#AAAAAA));
numButtons[0] = new Button(65, 265, 30, 30, "0", color(#FFFFFF), color(#AAAAAA));
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

void mousePressed() {
// Number buttons individually handled like Ethan
for (int i = 0; i < numButtons.length; i++) {
if (numButtons[i].over) {
if (dVal.equals("0")) dVal = numButtons[i].val;
else dVal += numButtons[i].val;

if (left) l = float(dVal);
else r = float(dVal);
}
}

// Function buttons individually handled like Ethan
for (int i = 0; i < buttons.length; i++) {
if (buttons[i].over && buttons[i].val.equals("C")) {
l = r = result = 0;
dVal = "0";
op = "";
left = true;
} else if (buttons[i].over && buttons[i].val.equals("del")) {
if (dVal.length() > 1) dVal = dVal.substring(0, dVal.length() - 1);
else dVal = "0";
if (left) l = float(dVal);
else r = float(dVal);
} else if (buttons[i].over && buttons[i].val.equals("+")) {
op = "+";
left = false;
dVal = "0";
} else if (buttons[i].over && buttons[i].val.equals("-")) {
op = "-";
left = false;
dVal = "0";
} else if (buttons[i].over && buttons[i].val.equals("×")) {
op = "×";
left = false;
dVal = "0";
} else if (buttons[i].over && buttons[i].val.equals("÷")) {
op = "÷";
left = false;
dVal = "0";
} else if (buttons[i].over && buttons[i].val.equals("^")) {
op = "^";
left = false;
dVal = "0";
} else if (buttons[i].over && buttons[i].val.equals("=")) {
performCalculation();
left = true;
l = result;
} else if (buttons[i].over && buttons[i].val.equals("+/-")) {
float temp = float(dVal) * -1;
dVal = str(temp);
if (left) l = temp;
else r = temp;
} else if (buttons[i].over && buttons[i].val.equals("rnd")) {
float temp = round(float(dVal));
dVal = str(temp);
if (left) l = temp;
else r = temp;
} else if (buttons[i].over && buttons[i].val.equals("√")) {
float temp = sqrt(float(dVal));
dVal = str(temp);
if (left) l = temp;
else r = temp;
} else if (buttons[i].over && buttons[i].val.equals("π")) {
if (left) l = PI;
else r = PI;
dVal = str(PI);
} else if (buttons[i].over && buttons[i].val.equals(".")) {
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
else if (op.equals("×")) result = l * r;
else if (op.equals("÷")) result = (r != 0) ? l / r : 0;
else if (op.equals("^")) result = pow(l, r);
dVal = str(result);
l = result;
left = true;
}
