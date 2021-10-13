Zoog myzoog;

void setup(){
  size(200,200);
  //creating my zoog
  myzoog= new Zoog(100,125,60,60,16);
}

void draw(){
  background(255);
  //mouseX determines speed
  float factor=constrain(mouseX/10,0,5);
  //calling functions
  myzoog.jiggle(factor);
  myzoog.display();
  
}

class Zoog{
  
//properties
float x;
float y;
float w;
float h;
float eyeSize;

//constructor
Zoog(float tempX, float tempY, float tempW, float tempH, float tempEyeSize){
  x=tempX;
  y=tempY;
  w=tempW;
  h=tempH;
  eyeSize=tempEyeSize;
}
//methods
void jiggle(float speed){
  //change the location of zoog
  x=x+random(-1,1)*speed;
  y=y+random(-1,1)*speed;
  
  //constrain zoog
  x=constrain(x,0,width);
  y=constrain(y,0,height);
}


void display(){
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //zoog's arms
  for(float i=y+5; i<y+h; i+=10){
    stroke(0);
    line(x-w/3,i,x+w/3,i);
  }
  
  //zoog's body
  stroke(0);
  fill(175);
  rect(x,y,w/6,h*2);
  
  //zoog's head
  fill(255);
  ellipse(x,y-h/2,w,h);
  
  //zoog's eyes
  fill(0);
  ellipse(x-w/3,y-h/2,eyeSize,eyeSize*2);
  ellipse(x+w/3,y-h/2,eyeSize,eyeSize*2);
  
  //zoog's legs
  stroke(0);
  line(x-w/12,y+h,x-w/4,y+h+10);
  line(x+w/12,y+h,x+w/4,y+h+10);
}
}
