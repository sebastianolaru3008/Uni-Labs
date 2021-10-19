//includem fișierul cu definițiile pentru tonuri
#include "pitches.h"
int melody[] = {
NOTE_D4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_D4,
NOTE_D4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_D4, 
NOTE_D4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_D4,  
NOTE_A3, NOTE_C4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_E4, NOTE_F4, NOTE_F4, 
NOTE_F4, NOTE_G4, NOTE_E4, NOTE_E4, NOTE_D4, NOTE_C4, NOTE_C4, NOTE_D4,
0, NOTE_A3, NOTE_C4, NOTE_B3, NOTE_D4, NOTE_B3, NOTE_E4, NOTE_F4,
NOTE_F4, NOTE_C4, NOTE_C4, NOTE_C4, NOTE_C4, NOTE_D4, NOTE_C4,
NOTE_D4, 0, 0, NOTE_A3, NOTE_C4, NOTE_D4, NOTE_D4, NOTE_D4, NOTE_F4,
NOTE_G4, NOTE_G4, NOTE_G4, NOTE_A4, NOTE_A4, NOTE_A4, NOTE_A4, NOTE_G4,
NOTE_A4, NOTE_D4, 0, NOTE_D4, NOTE_E3, NOTE_F4, NOTE_F4, NOTE_G4, NOTE_A4, 
NOTE_D4, 0, NOTE_D4, NOTE_F4, NOTE_E4, NOTE_E4, NOTE_F4, NOTE_D4
};
int noteDurations[] = {
4,8,4,8,4,8,8,8,8,4,8,4,8,4,8,8,8,8,4,8,4,8,
4,8,8,8,8,4,4,8,8,4,4,8,8,4,4,8,8,
8,4,8,8,8,4,4,8,8,4,4,8,8,4,4,8,4,
4,8,8,8,8,4,4,8,8,4,4,8,8,4,4,8,8,
8,4,8,8,8,4,4,4,8,4,8,8,8,4,4,8,8
};
void setup() {
  //pentru fiecare notă din vectorul melody
  for (int thisNote = 0; thisNote < 8; thisNote++) {
    //calculăm durata de afișare a notei
    int noteDuration = 1000 / noteDurations[thisNote];
    //apelăm funcția de tone pentru difuzorul atașat la
    //pinul 8 și durata specificată
    tone(8, melody[thisNote], noteDuration);
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    noTone(8);
  }
}
void loop()
{
}
