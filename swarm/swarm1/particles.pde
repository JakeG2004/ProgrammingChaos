class particle{
  float x, y;
  color c;
  float xv, yv;
  float speed = 0.2;
  
  //constructor
  particle(int i){
    float normI = i * (2 * PI) / swarmSize;
    //place particles
    x = width * .5;
    y = height * .5;
    
    //give color based on position in index
    float pedalVal = abs(sin(normI * 3));
    c = color(pedalVal * 255, pedalVal * 255, 0);
    
    //give velocity
    xv = pedalVal * cos(normI) * speed;
    yv = pedalVal * sin(normI) * speed;
  }
  
  void update(){
    //update pos
    x += xv;
    y += yv;
    
    //wrap if on edge
    //x = (x + width) % width;
    //y = (y + height) % height;
  }
  
  void display(){
    noStroke();
    //draw filled circles
    fill(c);
    circle(x, y, 15); 
  }
  
};
