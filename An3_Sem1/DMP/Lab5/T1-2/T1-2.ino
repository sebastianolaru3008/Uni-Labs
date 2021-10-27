#include <LiquidCrystal.h>
// Includem biblioteca wire pentru I2C
#include <Wire.h>
LiquidCrystal lcd(7, 6, 5, 4, 3, 2);
char data[100] = "";
char print_data[100] = "";
char recievedData[100] = "";
char print_recievedData[100] = "";
char empty[100] = "";
void setup() {
  // Pornim busul I2C ca și slave la adresa 9
  Wire.begin(9);
  Serial.begin(9600);
  // Atașăm o funcție care să se declanșeze atunci când primim
  //ceva
  Wire.onReceive(receiveEvent);
  lcd.begin(16, 2);
  lcd.print("Slave");
}
void loop() {

  if(Serial.available()){
    Serial.readBytesUntil('\n', data, 100);
    sprintf(print_data, "Eu: %s", data);
    Serial.println(print_data); 
    strcpy(print_data,empty);
  }

  if( strcmp(data,"")){
    lcd.setCursor(0,0);
    lcd.print("Master        ");
    Wire.begin();
    Wire.beginTransmission(9); // transmitem spre device #9
    Wire.write(data); // trimitem x
    Wire.endTransmission(); // oprim transmisia
    delay(1000);
    Wire.begin(9);
    strcpy(data,empty);
    lcd.setCursor(0,0);
    lcd.print("Slave          ");
  }

  if(strcmp(recievedData,"")){
    lcd.setCursor(0,1);
    lcd.print(recievedData);
    strcpy(recievedData,empty);
  }
  
}

void receiveEvent(int bytes) {
  Wire.readBytes(recievedData, bytes);
  sprintf(print_recievedData, "Jurnalist:  %s", recievedData);
  Serial.println(print_recievedData);
  strcpy(print_recievedData,empty); 
}
