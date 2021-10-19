int state;
int buttons[4];
int timer = 100;           
int ledPins[] = {

  30, 32, 34, 36
};       
int ledPinCount = 4;
int buttonPins[] = {

  38, 40, 41, 39
};       
int buttonPinCount = 4;

void setup() {

  state = 0;

  for (int thisPin = 0; thisPin < ledPinCount; thisPin++) {
    pinMode(ledPins[thisPin], OUTPUT);
  }

  for (int thisPin = 0; thisPin < buttonPinCount; thisPin++) {
    pinMode(buttonPins[thisPin], INPUT_PULLUP);
  }

  Serial.begin(9600);
}

void mode1(){
  for (int thisPin = 0; thisPin < ledPinCount; thisPin++) {

    digitalWrite(ledPins[thisPin], HIGH);
    delay(timer);
    digitalWrite(ledPins[thisPin], LOW);

  }
  for (int thisPin = ledPinCount - 1; thisPin >= 0; thisPin--) {

    digitalWrite(ledPins[thisPin], HIGH);
    delay(timer);
    digitalWrite(ledPins[thisPin], LOW);

  }
}

void mode2(){
  
  for (int thisPin = 0; thisPin < ledPinCount; thisPin++) {

    if(thisPin % 2 == 0)
      digitalWrite(ledPins[thisPin], HIGH);
    else
      digitalWrite(ledPins[thisPin], LOW);

  }
  delay(2*timer);
  
  for (int thisPin = 0; thisPin < ledPinCount; thisPin++) {

    if(thisPin % 2 != 0)
      digitalWrite(ledPins[thisPin], HIGH);
    else
      digitalWrite(ledPins[thisPin], LOW);

  }
  delay(2*timer);
}

void loop() {

  buttons[0] = digitalRead(buttonPins[0]);
  buttons[2] = digitalRead(buttonPins[1]);
  buttons[3] = digitalRead(buttonPins[2]);
  buttons[4] = digitalRead(buttonPins[3]);

  if(buttons[0] == LOW) state = 0;
  if(buttons[1] == LOW) state = 1;
  if(buttons[2] == LOW) state = 2;
  if(buttons[3] == LOW) state = 3;

  if(state == 0)
    mode1();
  else if(state == 1)
    mode2();
  else if(state == 2)
    mode1();
  else if(state == 3)
    mode2();

  Serial.println(String(buttons[0])+String(buttons[1])+String(buttons[2])+String(buttons[3]));
  Serial.println(state);
}
