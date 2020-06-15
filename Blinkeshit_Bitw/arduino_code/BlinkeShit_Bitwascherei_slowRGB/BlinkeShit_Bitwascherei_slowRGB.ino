#include <Adafruit_NeoPixel.h>
#include "pitches.h"

// BlinkeShit for Bitwäscherei
// ***************************
// modified from various code of the 8Bit Mixtape NEO
// http://neo.8bitmixtape.cc/
// using the Audio Upload Bootloader by C.Haberer aka ChrisMikro
// https://github.com/ChrisMicro/TinyAudioBoot
// 

#define NEOPIXELPIN    0
#define NUMPIXELS      8
#define SPEAKERPIN     1

uint8_t showPixel = 0;

byte i;

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, NEOPIXELPIN, NEO_GRB + NEO_KHZ800);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* Specific functions of the NEO-Pixel Library
 _____ _____ _____        _         _ 
|   | |   __|     |   ___|_|_ _ ___| |
| | | |   __|  |  |  | . | |_'_| -_| |
|_|___|_____|_____|  |  _|_|_,_|___|_|
                     |_|              
========================================================================================================================
   _________    
  | NEO(x)  |   void setWhiteAllPixel(uint32_t color)                   -> Sets all the pixels to the white level
  |  o___o  |   void displayBinrayValue(uint16_t value, uint32_t color) -> displays binary number
  |__/___\__|   uint32_t Wheel(byte WheelPos)                           -> Input a value 0 to 255 to get a color value.   
                                                                        The colours are a transition r - g - b - back to r. 
                                
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

void setWhiteAllPixel(uint32_t color)
{
  uint8_t n;
  for (n = 0; n < NUMPIXELS; n++)
  {
    pixels.setPixelColor(n, color, color, color);
  }
}

void setColorAllPixel(uint32_t color)
{
  uint8_t n;
  for (n = 0; n < NUMPIXELS; n++)
  {
    pixels.setPixelColor(n, color);
  }
}

void displayBinrayValue(uint16_t value, uint32_t color)
{
  uint8_t n;
  for (n = 0; n < NUMPIXELS; n++)
  {
    if (value & (1 << n)) pixels.setPixelColor(n, color);
    //else pixels.setPixelColor(n,0); // off
  }
}

void rainbowCycle(uint8_t wait, uint8_t rounds, uint8_t rainbowPixels) {
  uint16_t i, j;

  for (j = 0; j < 256 * rounds; j++) { 
    for (i = 0; i < rainbowPixels; i++) {
      pixels.setPixelColor(i, Wheel(((i * 256 / rainbowPixels) + j) & 255));
    }
    pixels.show();
    delay(wait);
  }
}

uint32_t Wheel(byte WheelPos) {
  WheelPos = 255 - WheelPos;
  if (WheelPos < 85) {
    return pixels.Color(255 - WheelPos * 3, 0, WheelPos * 3);
  }
  if (WheelPos < 170) {
    WheelPos -= 85;
    return pixels.Color(0, WheelPos * 3, 255 - WheelPos * 3);
  }
  WheelPos -= 170;
  return pixels.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
}

// fast pin access
#define AUDIOPIN (1<<SPEAKERPIN)
#define PINLOW (PORTB&=~AUDIOPIN)
#define PINHIGH (PORTB|=AUDIOPIN)

void playSound(long freq_Hz, long duration_ms)
{
  uint16_t n;
  uint32_t delayTime_us;
  uint32_t counts;

  delayTime_us = 1000000UL / freq_Hz / 2;
  counts = duration_ms * 1000 / delayTime_us;

  for (n = 0; n < counts; n++)
  {
    PINHIGH;
    delayMicroseconds(delayTime_us);
    PINLOW;
    delayMicroseconds(delayTime_us);
  }
}


int c[] = {
  NOTE_B4, NOTE_G4, NOTE_D4, NOTE_G4, NOTE_A4, NOTE_D5, PAUSE, NOTE_A4, NOTE_B4, NOTE_A4, NOTE_D4, NOTE_G4 
};

int pauseBetweenNotes = 80;
int noteDuration_ms = 150;

void playMart(int notes[])
{
  // iterate over the notes of the melody:
  for (int thisNote = 0; thisNote <= 11; thisNote++) {

    displayBinrayValue(notes[thisNote],pixels.Color(50,0,50));
    pixels.show(); // This sends the updated pixel color to the hardware.
    playSound( notes[thisNote], noteDuration_ms);
    setColorAllPixel(0); // pixels off
    // to distinguish the notes, set a minimum time between them.
    // the note's duration + 30% seems to work well:
    delay(pauseBetweenNotes);
        
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* the setup routine runs once when you start the tape or press reset
========================================================================================================================
   _________            _                   
  | setup() |   ___ ___| |_ _ _ _ _ 
  |  o___o  |  |_ -| -_|  _| | | . |
  |__/___\__|  |___|___|_| |___|  _|
                               |_|    
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/


void setup(void) {

  pinMode(SPEAKERPIN, OUTPUT);
  uint8_t brightness = hell;
  pixels.begin();
  pixels.setBrightness(brightness);
  
  //rainbowCycle(30,50,32);
  
  setColorAllPixel(0);
  pixels.setBrightness(brightness);
  pixels.show(); // Initialize all pixels to 'off'
    
  playMart(c);
  
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* The main loop to put all your code
========================================================================================================================
   _________    _    
  | loop()  |  | |___ ___ ___ 
  |  o___o  |  | | . | . | . | 
  |__/___\__|  |_|___|___|  _| 
                         |_| 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

void loop(void) {

  rainbowCycle(30,50,32);

}
