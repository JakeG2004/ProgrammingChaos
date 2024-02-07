class snowFlake
{
  float angle;
  float scale;
  float hue;
  float newHue;
  float recursions;
  float brightness = 100;
  
  snowFlake(){
     reset();
  }
  
  void reset(){
    angle = random(.25, .5); //determine random angle
    scale = random(0.4, 0.7); //dtermine random scale
    hue = random(180, 220); //random col
    recursions = int(random(2, 3)); //random recursion depth
  }
  
  void display()
  {
    
    for(int i = 0; i < 6; i++){
      //reset color
      brightness = 100;
      stroke(hue, 100, brightness);
      
      //rotate coordinate system
      pushMatrix();
        strokeWeight(width * .15 * .1); //reset stroke weight
        rotate(i * (2 * PI) / 6.0); //rotate by 60 deg each time
        line(0, 0, width * .15, 0); //draw line
        translate(width * .15, 0); //translate to end of line
        branch(width * .15 * scale, 0); //make a branch
      popMatrix();
    }
  }
  
  void branch(float len, int depth)
  {
    // limit recursion depth
    if (depth > recursions) {
      return;
    }
  
    resetColor(depth);
  
    // draw left branch
    pushMatrix();
      strokeWeight(len * 0.1);
      rotate(-1 * angle * PI);
      line(0, 0, len, 0);
      translate(len, 0);
      branch(len * (scale - .1), depth + 1);
    popMatrix();
    
    resetColor(depth);
  
    // draw right branch
    pushMatrix();
      strokeWeight(len * 0.1);
      rotate(angle * PI);
      line(0, 0, len, 0);
      translate(len, 0);
      branch(len * (scale - .1), depth + 1);
    popMatrix();
    
    resetColor(depth);
  
    // draw straight branch 
    pushMatrix();
      strokeWeight(len * 0.1);
      rotate(0); // reset rotation to 0
      line(0, 0, len, 0);
      translate(len, 0);
      branch(len * scale, depth + 1);
    popMatrix();
  }
  
  void resetColor(int depth){
    // set new color
    brightness = (100 - (depth * 20));
    newHue = hue;
    //newHue = (hue - (depth * 10));
    stroke(newHue, 100, brightness); 
  }

};
