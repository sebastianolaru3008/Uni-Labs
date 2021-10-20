#include "animation.h"
#include "song.h"
#include <TimerOne.h>

// change this to whichever pin you want to use
int buzzer = 51;

//setting up basics
void setup() {

  Timer1.initialize(1*1000000); //se inițializează intervalul
  //de timp la care temporizatorul va
  // declanşa evenimente (în microsecunde, 1000000
  //microsecunde = 1 secundă)
  Timer1.attachInterrupt(songInter);
  lcd.begin(16, 2);
  lcd.clear();
  standingMan();
}

//putting all the pieces together in a loop:
void loop() {
  //pentru fiecare notă din vectorul melody
  for (int thisNote = 0; thisNote < (sizeof(melody)/sizeof(melody[0])); thisNote++) {
    //calculăm durata de afișare a notei
    int noteDuration = 1000 / noteDurations[thisNote];
    //apelăm funcția de tone pentru difuzorul atașat la
    //pinul 8 și durata specificată
    tone(buzzer, melody[thisNote], noteDuration);
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    noTone(buzzer);
  }

}

void songInter() {
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
