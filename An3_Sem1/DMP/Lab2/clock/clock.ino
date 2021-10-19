int latchPin = 4;
int clockPin =7;
int dataPin = 8; // Pinii SSD
const unsigned char ssdlut[] = {
0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
const unsigned char anodelut[] = {0b00000001, 0b00000010,
0b00000100, 0b00001000};
const unsigned char digits[] = {0x1,0xB,0xC,0xD};
String state;
unsigned long myTime=0;
unsigned long startTime = 0;
unsigned long stopTime = 0;
unsigned char prevA1 = 1;
unsigned char prevA2 = 1;
unsigned char prevA3 = 1;

void setup ()
{
  pinMode(latchPin,OUTPUT);
  pinMode(clockPin,OUTPUT);
  pinMode(dataPin,OUTPUT); 
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
}
void loop()
{
  if(digitalRead(A1) == 0 && prevA1 != digitalRead(A1)){
    state = "Start";
    startTime = millis();
  }
  else if(digitalRead(A2) == 0 && prevA2 != digitalRead(A2)){
    state = "Stop";
    stopTime = myTime;
  }
  else if(digitalRead(A3) == 0&& prevA3 != digitalRead(A3)){
    startTime = millis();
    myTime = 0;
    stopTime = 0;
    state = "Stop";
  }

  prevA1 = digitalRead(A1);
  prevA2 = digitalRead(A2);
  prevA3 = digitalRead(A3);

  if (state == "Start"){
    myTime = millis() - startTime + stopTime; 
  }
  
  for(char i=0; i<=3; i++) 
  {
    // unsigned char digit = digits[i];
    unsigned char cathodes = ~ssdlut[(int)(myTime/pow(10,3-i))%10]; 

    digitalWrite(latchPin,LOW);
    shiftOut(dataPin,clockPin,MSBFIRST, cathodes); 
    shiftOut(dataPin,clockPin,MSBFIRST, anodelut[i]);
    digitalWrite(latchPin,HIGH);
    delay(2); 
  }
}
