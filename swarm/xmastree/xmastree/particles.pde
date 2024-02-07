float speed = 2.0;
class particles{
  float x, y;
  color c;
  float angle;
  
  particles(int i){
    //set angle and pos
    angle = i * (2 * PI) / swarmSize;
    y = height * 0.5 + height * 0.4 * sin(10 * angle);
    x = width * .5 + (y - (0.1 * height)) * .3 * cos(61 * angle);
    
    //set color
    c = color(random(0, 50), 100, 100);
  }
  
  void update(){
    //set angle and pos
    angle += speed * (2 * PI) / swarmSize;
    y = height * 0.5 + height * 0.4 * sin(10 * angle);
    x = width * .5 + (y - (0.1 * height)) * .3 * cos(61 * angle);
    
    //update color
    c = color((hue(c) + 1) % 360, 100, 100);
  }
  
  void display(){
    fill(c);
    circle(x, y, 4);
  }
}
