class point{
  float x, y;
  point(float dx, float dy){
    x = dx;
    y = dy;
  }
  
  void display(){
    //find angle to center
    float dx = x - (width * 0.5);
    float dy = y - (height * 0.5);
    float angle = atan2(dy, dx);
    
    // Map the angle to the range [0, 360]
    angle = degrees(angle);
    if (angle < 0) {
      angle += 360;
    }
    
    //draw circle
    fill(angle, 100, 100);
    circle(x, y, 5);
  }
  
  void newPos(){
    //random pos
    x = random(width);
    y = random(height);
  }
};
