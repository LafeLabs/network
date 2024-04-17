#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
#endif

// Which pin on the Arduino is connected to the NeoPixels?
#define PIN 12 // On Trinket or Gemma, suggest changing this to 1

// How many NeoPixels are attached to the Arduino?
#define NUMPIXELS 8 // 
//there are 8

// When setting up the NeoPixel library, we tell it how many pixels,  
// and which pin to use to send signals. Note that for older NeoPixel
// strips you might need to change the third parameter -- see the
// strandtest example for more information on possible values.
Adafruit_NeoPixel pixels(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);



int delay_time = 10;//ms

int x = 10;
int index = 0;


//Chaos demo
//calculate chaotic driven damped pendulum trajectory using fourth order Runge-Kutta
// 
 
  float t = 0.0;
  int period = 15;
  float y[] = {0.0,0.0};
  float E;
  float f0 = 0.0;  //velocity
  float f1 = 0.0;  //accelleration
  float f[] = {0.0,0.0};
  float k1[] = {0.0,0.0};
  float k2[] = {0.0,0.0};
  float k3[] = {0.0,0.0};
  float k4[] = {0.0,0.0};
  
  float theta = 0.0;
  float thetadot = 0.0;
  float force;
      
  float pi = 3.14159;

  float yindex = 0.1;
  float ynext[] = {0.0,0.0};
 
  float gamma = 0.4; 
  float omega0 = 0.65;
//float omega0 = 3.0;
  float h = 0.02; //time step in fractions of natural period 
  float A = 1.3;  

 
  int motorpin = 5;
  int motorspeed = 0;

#include <MozziGuts.h>
#include <Oscil.h> // oscillator template
#include <tables/sin2048_int8.h> // sine table for oscillator

// use: Oscil <table_size, update_rate> oscilName (wavetable), look in .h file of table #included above
Oscil <SIN2048_NUM_CELLS, AUDIO_RATE> aSin(SIN2048_DATA);

// use #define for CONTROL_RATE, not a constant
#define CONTROL_RATE 64 // Hz, powers of 2 are most reliable

 
void setup() {
   Serial.begin(9600);
       pixels.begin(); // INITIALIZE NeoPixel strip object (REQUIRED)
    startMozzi(CONTROL_RATE); // :)
    aSin.setFreq(2600); // set the freq to knob in Hz
    pinMode(9,OUTPUT); 

}
void updateControl(){
  // put changing controls in here
}


AudioOutput_t updateAudio(){
  return MonoOutput::from8Bit(aSin.next()); // return an int signal centred around 0
}


void loop() {
  
  force = 0;
  
  k1[0] = getf0(t,y,gamma,omega0,A,force);
  k1[1] = getf1(t,y,gamma,omega0,A,force);

  ynext[0] = y[0] + 0.5*h*k1[0];
  ynext[1] = y[1] + 0.5*h*k1[1];
  
  k2[0] = getf0(t+0.5*h,ynext,gamma,omega0,A,force);
  k2[1] = getf1(t+0.5*h,ynext,gamma,omega0,A,force);

  ynext[0] = y[0] + 0.5*h*k2[0];
  ynext[1] = y[1] + 0.5*h*k2[1];
  
  k3[0] = getf0(t+0.5*h,ynext,gamma,omega0,A,force);
  k3[1] = getf1(t+0.5*h,ynext,gamma,omega0,A,force);

  ynext[0] = y[0] + h*k3[0];
  ynext[1] = y[1] + h*k3[1];

  k4[0] = getf0(t+h,ynext,gamma,omega0,A,force);
  k4[1] = getf1(t+h,ynext,gamma,omega0,A,force);
  
  
  ynext[0] = y[0] + 0.1667*h*(k1[0] + 2*k2[0] + 2*k3[0] + k4[0]);
  ynext[1] = y[1] + 0.1667*h*(k1[1] + 2*k2[1] + 2*k3[1] + k4[1]);  


  theta = 255.0*abs(y[0])/pi;
  thetadot = 255.0*abs(y[1])/pi;

  //wrap the angle around if it goes above or below pi
  if(ynext[0] >= pi){
     ynext[0] = ynext[0] - 2*pi;
  }
  if(ynext[0] <= -pi){
     ynext[0] = ynext[0] + 2*pi;
  }

  y[0] = ynext[0];
  y[1] = ynext[1];

  t = t + h;
         
  x = int(theta);
  Serial.print(theta);
  Serial.print(",");
  Serial.println(thetadot);

  motorspeed = theta;
//  analogWrite(motorpin,motorspeed);
  aSin.setFreq(100 + 10*thetadot);      
 audioHook(); // required here

  
}


float getf0(float t,float y[],float gamma, float omega0, float A,float force){
  float result;
  result = y[1];
  return result;
}
float getf1(float t,float y[],float gamma, float omega0,float A, float force){
  float result;
  result = -sin(y[0]) - gamma*y[1] + A*cos(omega0*t) + force;
  return result;
}
