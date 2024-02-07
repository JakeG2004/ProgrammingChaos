particle[] swarm;
int swarmSize = 600;

void setup(){
  size(900, 1000);
  colorMode(HSB, 360, 100, 100);
  
  //init swarm
  swarm = new particle[swarmSize];
  for(int i = 0; i < swarmSize; i++){
    swarm[i] = new particle();
  }
  
  //init starter freeze
  swarm[0].frozen = true;
  swarm[0].x = width * .5;
  swarm[0].y = height - 5;
  swarm[0].radius = 15;
}

void draw(){
  //set bg color
  background(0);
  
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
