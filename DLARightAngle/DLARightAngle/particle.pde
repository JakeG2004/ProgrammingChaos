float noise = 10.0;
float freezeDist = 25;
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
    //skip if frozen
    if(frozen){
      return;
    }
    
    
    
    //update position with noise
    x += random(-noise, noise);
    y += random(-noise, noise);
    
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
              radius = parent.radius * 0.99;
              
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
              
              //snap on 45s
              y = parent.y + (freezeDist * (dy / abs(dy)));
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
      strokeWeight(radius * .5);
      line(x, y, parent.x, parent.y);
    }
    
    //draw circle
    noStroke();
    fill(hue, 100, 100);
    circle(x, y, radius);
  }
};
