import processing.sound.*;
SinOsc beep; // sine wave oscillator
String inputString = "";
int inputVal;
int beepFreq;

void setup() {
  // window size
  size(400, 400);
  surface.setResizable(true);
  // beep initialization
  beep = new SinOsc(this);
}

void draw() {
  // background color (grayscale)
  background(200);
}

void keyPressed() {
  if (key == ENTER || key == RETURN) {
    // input String to int
    inputVal = int(inputString);
    // show the input value
    println("received val: " + inputVal);
    
    // map input value to appropriate freq
    beepFreq = int(map(inputVal, 0, 30, 200, 1000));
    beep.freq(beepFreq); // freq
    
    // do not play beep if the value is 0
    if (inputVal > 0) {
      // play
      beep.play();
      
      // stop after 0.5 sec
      delay(500);
      beep.stop();
    }
    
    // reset the input String
    inputString = "";
  } else { // wait until ENTER/RETURN pressed
    inputString += key;
  }
}
