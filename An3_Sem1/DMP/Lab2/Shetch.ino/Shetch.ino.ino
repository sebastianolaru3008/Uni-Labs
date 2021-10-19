int latchPin = 4;
int clockPin =7;
int dataPin = 8; // Pinii SSD
const unsigned char ssdlut[] = {
0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
const unsigned char anodelut[] = {0b00000001, 0b00000010,
0b00000100, 0b00001000};
const unsigned char digits[] = {0x1,0xB,0xC,0xD};
unsigned int number = 2021;
char prevUpState = 1;
char prevDownState = 1;
void setup ()
{
pinMode(latchPin,OUTPUT);
pinMode(clockPin,OUTPUT);
pinMode(dataPin,OUTPUT); 
pinMode(A1, INPUT);
pinMode(A2, INPUT);
}
void loop()
{
  if(digitalRead(A1) == 0 && digitalRead(A1) != prevUpState)
    number++;
  else if(digitalRead(A2) == 0 && digitalRead(A2) != prevDownState)
    number--;

  prevUpState = digitalRead(A1);
  prevDownState = digitalRead(A2);
  
  
  for(char i=0; i<=3; i++) 
  {
    // unsigned char digit = digits[i];
    unsigned char cathodes = ~ssdlut[(int)(number/pow(10,3-i))%10]; 

    digitalWrite(latchPin,LOW);
    shiftOut(dataPin,clockPin,MSBFIRST, cathodes); 
    shiftOut(dataPin,clockPin,MSBFIRST, anodelut[i]);
    digitalWrite(latchPin,HIGH);
    delay(2); 
  }
}
