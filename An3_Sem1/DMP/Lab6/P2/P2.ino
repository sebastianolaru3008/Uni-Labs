void setup() {
 Serial.begin(9600);
 pinMode(8, OUTPUT);
}
void loop(){
 Serial.print("Temp [C]: ");
 float temp = readMean(10, A8); // citeste temperatura
 float thermostat = readMean(10, A15);
 //de 10 ori, face media
 float diff1 = (temp - thermostat)/4;
 float diff2 = (thermostat - temp)/4;
 if(diff1 > 0)
  analogWrite(8,((int)diff1)%255);
 else
  analogWrite(9,((int)diff2)%255);
 Serial.print(temp);
 Serial.print(", ");
 Serial.print(thermostat);
 Serial.print(", ");
 Serial.println(diff1);
}
float readMean(int count, int pin) {
 
 float sumTemp = 0;
 for (int i =0; i < count; i++) {
 int reading = analogRead(pin);
 // scade deplasament, convertește în grade C
 sumTemp = sumTemp + (float)reading; // suma temperaturilor
 }
 return sumTemp / (float)count; // media returnată
}
