particles[] swarm;
int swarmSize = 20000;

void setup(){
  //init window
  size(800, 950);
  colorMode(HSB, 360, 100, 100);
  
  //init array
  swarm = new particles[swarmSize];
  for(int i = 0; i < swarmSize; i++){
    swarm[i] = new particles(i);
  }
  
  noStroke();
  background(0);
}

void draw(){
  fill(0, mouseY * (100.0 / height));
  rect(0, 0, width, height);
  for(int i = 0; i < swarmSize; i++){
    swarm[i].update();
  }
  for(int i = 0; i < swarmSize; i++){
    if(i % (mouseX + 1) == 0){
      swarm[i].display();
    }
  }
}
