int numPoints = 10000;
point[] points;
point currentPoint;
int curIndex = 1;
int curFrameRate = 10;

point[] corners;

void setup(){
  frameRate(curFrameRate);
  colorMode(HSB, 360, 100, 100);
  size(800, 800);
  initTriangle();
  initPoint();
}

void initTriangle(){
  //define arrays
  points = new point[numPoints];
  corners = new point[3];
  
  //define corners
  corners[0] = new point(10, height - 10);
  corners[1] = new point(width / 2, 10);
  corners[2] = new point(width - 10, height - 10);
  
  //make that thang
  makeTriangle();
}

void draw(){
  //prevent out of bounds
  if(curIndex >= numPoints){
    return;
  }
  
  //choose rand corner
  point corner = corners[int(random(3))];
      
  //calc avg pos
  float avgX = (currentPoint.x + corner.x) * 0.5;
  float avgY = (currentPoint.y + corner.y) * 0.5;
      
  //make point at avg pos and set it to the current point
  points[curIndex] = new point(avgX, avgY);
  points[curIndex].display();
  
  currentPoint = points[curIndex];
  
  //increment
  curIndex++;
  
  curFrameRate += 1;
  print(curFrameRate, "\n");
  frameRate(curFrameRate);
}

void initPoint(){
  //put at random position in the triangle
  points[0] = new point(random(width), random(height));
  while(!(isInTriangle(points[0]))){
    points[0].newPos();
  }
  
  //show it
  points[0].display();
  
  currentPoint = points[0];
}

void makeTriangle(){
  //get the corners
  point p1 = corners[0];
  point p2 = corners[1];
  point p3 = corners[2];
  
  //make a triangle
  triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
}
  
boolean isInTriangle(point point){
  //calculate totals
  float totalBase = corners[2].x - corners[0].x;
  float totalHeight = corners[0].y - corners[1].y;
  float totalArea = (totalBase * totalHeight * 0.5);
  
  //calculate all traingles using the point
  float A1 = findArea(point, corners[1], corners[2]);
  float A2 = findArea(point, corners[0], corners[2]);
  float A3 = findArea(point, corners[0], corners[1]);
  
  //if in the triangle, the areas should add up to totalarea
  return (totalArea == A1 + A2 + A3);
}

float findArea(point p0, point p1, point p2){
  //calc area of a traingle given 3 points
  return abs((p0.x * (p1.y - p2.y) + p1.x * (p2.y - p0.y) + p2.x * (p0.y - p1.y)) / 2.0);
}
