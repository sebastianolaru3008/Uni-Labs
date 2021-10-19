#include <LiquidCrystal.h>
LiquidCrystal lcd(7, 6, 5, 4, 3, 2);
// Masca pentru primul caracter, fiecare linie de biţi 
//reprezintă o linie a caracterului
String castraveti = "Castraveeti,  castraveti aveeem.   ";

byte happy[8] = {
  B00000,
  B11011,
  B11011,
  B00000,
  B00000,
  B10001,
  B01110,
};
// Masca pentru al doilea caracter
byte sad[8] = {
  B00000,
  B11011,
  B11011,
  B00000,
  B00000,
  B01110,
  B10001,
};
byte scared[8] = {
  B00000,
  B11011,
  B11011,
  B00000,
  B01110,
  B01110,
  B01110,
};
byte scared2[8] = {
  B00000,
  B11011,
  B11011,
  B00000,
  B01110,
  B00000,
  B00000,
};
int animFace = 0;
int anim = 0;
void setup() {
  lcd.begin(16, 2);
  // cele două caractere sunt stocate în CGROM, zona 
  //utilizator, poziţiile 0 şi 1
  lcd.createChar(0, scared2);
  lcd.createChar(1, scared);
  // Afişare prima linie, un text standard urmat de primul 
  //caracter utilizator
  lcd.setCursor(0, 0);
  lcd.print(castraveti);
  //write
  /* când referiți caracterul „0” trebuie să faceți un cast 
  la byte. Altfel compilatorul va semnala o eroare. Excepție 
  este cazul în care referiți o variabilă:
  byte zero = 0;
  lcd.write(zero);
  */
  // Afișare pe a doua linie
  lcd.setCursor(7, 1);
  lcd.write(1); // când referiți caractere diferite de „0” 
  //nu mai este necesar cast-ul;
 }
 // Funcţia loop rămâne nefolosită, puteți să o folosiți pentru 
 //a extinde funcționalitatea
void loop()
{
   lcd.setCursor(7, 1);
   lcd.write(byte(animFace));


    String front = castraveti.substring(0,1);
    String to = castraveti.substring(1,castraveti.length());
      
    castraveti = to + front;

    lcd.setCursor(0, 0);
    lcd.print(castraveti);


   anim++;
   if(anim == 4){
     anim = 0;
     animFace = 1 - animFace;
   }

   delay(300);
}
