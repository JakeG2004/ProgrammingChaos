particle[] swarm;
int swarmSize = 300;

void setup(){
  size(800, 950);
  
  //init swarm
  swarm = new particle[swarmSize];
  for(int i = 0; i < swarmSize; i++){
    swarm[i] = new particle(i);
  }
}

void draw(){
  //set bg color
  background(200);
  
  //update particles
  for(int i = 0; i < swarmSize; i++){
    swarm[i].update();
  }
  
  //draw particles
  for(int i = 0; i < swarmSize; i++){
    swarm[i].display();
  }
}

float sigmoid(float x){
  float r = 0.5;
  return(2.0/(1 + exp(-r * x)) - 1);
}
