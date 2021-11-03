void setup() {
 Serial.begin(9600);
 pinMode(8, OUTPUT);
}
void loop(){
 Serial.print("Temp [C]: ");
 float temp = readTempInCelsius(10, A8); // citeste temperatura
 //de 10 ori, face media
 Serial.println(temp); // afisare
 analogWrite(8,temp/4);
}
float readTempInCelsius(int count, int pin) {
 
 float sumTemp = 0;
 for (int i =0; i < count; i++) {
 int reading = analogRead(pin);
 // scade deplasament, convertește în grade C
 sumTemp = sumTemp + (float)reading; // suma temperaturilor
 delay(1);
 }
 return sumTemp / (float)count; // media returnată
}
