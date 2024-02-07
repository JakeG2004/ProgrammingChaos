class snowFlake
{
  float angle;
  float scale;
  float hue;
  float recursions;
  
  snowFlake(){
     reset();
  }
  
  void reset(){
    angle = random(.25, .5); //determine random angle
    scale = random(0.4, 0.7); //dtermine random scale
    hue = random(180, 220); //random col
    recursions = int(random(2, 4)); //random recursion depth
  }
  
  void display()
  {
    stroke(hue, 100, 100); //set color
    
    for(int i =0; i < 6; i++){
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
  
  void branch(float len, float depth)
    {
    //limit recursion depth
    if(depth > recursions){
      return;
    }
    
    //move out to the end of the line we just drew and draw left branch
    pushMatrix();
      //reduce stroke weight
      strokeWeight(len * 0.1);
      rotate(-1 * angle * PI);
      line(0, 0, len, 0);
      translate(len, 0);
      branch(len * (scale - .1), depth + 1);
    popMatrix();
    
    //draw right branch
    pushMatrix();
      //reduce stroke weight
      strokeWeight(len * 0.1);
      rotate(angle * PI);
      line(0, 0, len, 0);
      translate(len, 0);
      branch(len * (scale - .1), depth + 1);
    popMatrix();
    
    //draw straight branch 
    pushMatrix();
      //reduce stroke weight
      strokeWeight(len * 0.1);
      rotate(0); //reset rotation to 0
      //draw straight line
      line(0, 0, len, 0);
      translate(len, 0);
      branch(len * scale, depth + 1);
    popMatrix();
  }
};
