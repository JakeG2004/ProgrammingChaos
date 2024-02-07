snowFlake s1;

void setup(){
  //init window
  size(850, 1000);
  colorMode(HSB, 360, 100, 100);
  
  //init s1
  s1 = new snowFlake();
  
  frameRate(1);
}

void draw(){
  background(0);
  
  //translate coordinate system
  pushMatrix();
    translate(width * .5, height * .5);
    s1.display();
    s1.reset();
   popMatrix();
}
