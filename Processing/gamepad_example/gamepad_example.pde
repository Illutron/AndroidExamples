// Example showing the xperia gamepad
//
// Jonas Jongejan 13.7.2011
//

String keyText = "";
int keyInt = -1; 

void setup() {
  size(200, 200);
  noStroke();
  background(0);
}

void draw() { 
  background(0);
  text("Key: "+keyText + " number: "+keyInt,20,40);
}

void keyPressed() {
  //Not used!
}

boolean onKeyDown(int keyCode, KeyEvent event) {
  if (keyCode == KeyEvent.KEYCODE_DPAD_LEFT) {
    keyText = "LEFT";
  }
    if (keyCode == KeyEvent.KEYCODE_DPAD_RIGHT) {
    keyText = "RIGHT";
  }
    if (keyCode == KeyEvent.KEYCODE_DPAD_UP) {
    keyText = "UP";
  }
    if (keyCode == KeyEvent.KEYCODE_DPAD_DOWN) {
    keyText = "DOWN";
  }
  if (keyCode == 100) {
    keyText = "TRIANGLE";
  }
    if (keyCode == 99) {
    keyText = "SQUARE";
  }    
  if (keyCode == 23) {
    keyText = "X";
  }    
   
  keyInt = keyCode;
 return true;
}

