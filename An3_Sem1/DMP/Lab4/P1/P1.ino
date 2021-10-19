
#include  <LiquidCrystal.h>
#include "animation.h"

// initialize the library with the numbers
//of the interface pins:

//setting up basics
void setup() {
  // set up the LCD's number of columns and rows:
  lcd.begin(16, 2);
  // clear the LCD screen:
  lcd.clear();
  // get the standing man part on the screen:
  standingMan();
  // delay(y);
}

//putting all the pieces together in a loop:
void loop() {
  // start the Man animation:
  // run to the the right:
  runningManR();
  // slip to the right:
  ManslipR();
  // now run to the left:
  runningManL();
  // slip to the left:
  ManslipL();
}
