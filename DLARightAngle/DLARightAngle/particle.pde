float noise = 10.0;
float freezeDist = 15;
float gravity = 2;
float freezeDistSqrd = freezeDist * freezeDist;

class particle{
  float x, y;
  float hue;
  float radius;
  boolean frozen;
  particle parent;
  
  particle(){ //constructor
    //set random position
    x = random(width);
    y = random(height);
    hue = 0;
    radius = 15;
    frozen = false;
    parent = null;
  }
  
  void update(){
    //float xSign = (x - (width * 0.5)) / (abs(x - (width * 0.5)));
    //float ySign = (y - (height * 0.5)) / (abs(y - (height * 0.5)));
    float xBias = -3 * cos(x - (width * .5));
    float yBias = -3 * sin(y - (height * .5));
    
    //skip if frozen
    if(frozen){
      return;
    }
    
    
    
    //update position with noise
    x += random(-noise, noise) + xBias;
    y += random(-noise, noise) + yBias;// + gravity;
    
    //wrap if on edge
    x = (x + width) % width;
    //y = (y + height) % height;
    if(y > height){
      y = 1;
      x = random(width);
    }
    
    //check for freeze
    checkFreezing();
  }
  
  //TODO: Snap attachments to 45 degree angles
  void checkFreezing(){
    float dx, dy, distance;
    for(int i = 0; i < swarmSize; i++){
      if(swarm[i].frozen){
        //get distance to frozen particle
        dx = x - swarm[i].x;
        if(dx < freezeDist){
          dy = y - swarm[i].y;
          if(dy < freezeDist){
            distance = ((dx * dx) + (dy * dy));
            //freeze if close enough
            if(distance < freezeDistSqrd){
              frozen = true;
              parent = swarm[i];
              hue = (parent.hue + 4) % 360;
              radius = parent.radius * 0.98;
              
              //place particle
              
              if(abs(dx) <= freezeDist * 0.5){ //snap to top
                x = parent.x;
                y = parent.y + (freezeDist * (dy / abs(dy)));
                return;
              }
              
              if(abs(dy) <= freezeDist * 0.5){ //snap to side
                y = parent.y;
                x = parent.x + (freezeDist * (dx / abs(dx)));
                return;
              }
              
              y = parent.y - freezeDist;
              x = parent.x + (freezeDist * (dx / abs(dx)));
          
              return;
            }
          }
        }
      }
    }
  }
  
  void display(){
    //draw connecting line to parent
    if(parent != null){
      stroke(hue, 100, 100);
      line(x, y, parent.x, parent.y);
    }
    
    //draw circle
    noStroke();
    fill(hue, 100, 100);
    circle(x, y, radius);
  }
};
