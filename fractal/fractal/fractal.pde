float maxRecursionDepth = 5;
float scale = 0.5;
color c;

void setup(){
  size(850, 1000);
  rectMode(CENTER);
  colorMode(HSB, 255, 100, 100);
  
  noStroke();
  c = color(0, 100, 100);
}

void draw(){
  background(200);
  mySquare(width * .5 , height * .5, width * .3, 0);
}

void mySquare(float x, float y, float len, int depth){
  if(depth < maxRecursionDepth){
    mySquare(x - len * scale, y - len * scale, len * scale, depth + 1); //upper left
    mySquare(x + len * scale, y + len * scale, len * scale, depth + 1); //bottom right
    mySquare(x + len * scale, y - len * scale, len * scale, depth + 1); //bottom left
    mySquare(x - len * scale, y + len * scale, len * scale, depth + 1); //upper right
  }
  
  //modulate color based on depth
  c = color((255 / maxRecursionDepth) * depth, 100, 100);
  fill(c);
  rect(x ,y ,len, len);
}
