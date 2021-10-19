#include <LiquidCrystal.h>
LiquidCrystal lcd(7, 6, 5, 4, 3, 2);
// Masca pentru primul caracter, fiecare linie de biţi 
//reprezintă o linie a caracterului
String castraveti = "Castraveeti,  castraveti aveeem.   ";

int buttonPins[] = {

  20, 21, 19, 18 
};       
int buttonPinCount = 4;
volatile int button1;
volatile int button2;

byte clockAnim[8][8] = {{
  B01110,
  B10101,
  B10101,
  B10101,
  B10001,
  B10001,
  B01110,
},
{
  B01110,
  B10011,
  B10111,
  B10101,
  B10001,
  B10001,
  B01110,
},
{
  B01110,
  B10001,
  B10001,
  B10111,
  B10001,
  B10001,
  B01110,
},
{
  B01110,
  B10001,
  B10001,
  B10101,
  B10111,
  B10011,
  B01110,
},
{
  B01110,
  B10001,
  B10001,
  B10101,
  B10101,
  B10101,
  B01110,
},
{
  B01110,
  B10001,
  B10001,
  B10101,
  B11101,
  B11001,
  B01110,
},
{
  B01110,
  B10001,
  B10001,
  B11101,
  B10001,
  B10001,
  B01110,
},
{
  B01110,
  B11001,
  B11101,
  B10101,
  B10001,
  B10001,
  B01110,
}};
int clockAnimIndex = 0;
int clockTimer = 0;
String state = "Stop";
unsigned long myTime=0;
unsigned long startTime = 0;
unsigned long stopTime = 0;

unsigned long seconds = 0;
unsigned long milis = 0;

void setup() {
  for (int thisPin = 0; thisPin < buttonPinCount; thisPin++) {
    pinMode(buttonPins[thisPin], INPUT_PULLUP);
  }
  attachInterrupt(digitalPinToInterrupt(20), startTimer, 
  FALLING);
  attachInterrupt(digitalPinToInterrupt(21), stopTimer, 
  FALLING);
  attachInterrupt(digitalPinToInterrupt(19), resetTimer, 
  FALLING);

  
  lcd.begin(16, 2);
  for (int i = 0; i < 8; i++) {
    lcd.createChar(i, clockAnim[i]);
  }
  lcd.setCursor(7, 0);
  lcd.write(byte(0));
  lcd.setCursor(13,1);
  lcd.print(":");

 }
 // Funcţia loop rămâne nefolosită, puteți să o folosiți pentru 
 //a extinde funcționalitatea

void startTimer(){
    state = "Running";
    startTime = millis();
}
void resetTimer(){
    startTime = millis();
    myTime = 0;
    stopTime = 0;
    state = "Stop";
}
void stopTimer(){
    state = "Stop";
    stopTime = myTime;
}

void clockAnimFunc(){
  lcd.setCursor(7, 0);
  lcd.write(byte(clockAnimIndex));
  clockTimer = (clockTimer + 1) % 100;
  if(clockTimer == 99)
    clockAnimIndex = (clockAnimIndex + 1)%8;
}

void loop()
{
  if(state == "Running"){
     myTime = millis() - startTime + stopTime; 
    clockAnimFunc();
  }

  lcd.setCursor(0,1);
  lcd.print(state);
  lcd.setCursor(11,1);
  lcd.print(String((myTime/10000)%10));
  lcd.setCursor(12,1);
  lcd.print(String((myTime/1000)%10));
  lcd.setCursor(14,1);
  lcd.print(String((myTime/100)%10));
  lcd.setCursor(15,1);
  lcd.print(String((myTime/10)%10));
  
  
  delay(2);
}
