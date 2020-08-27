ArrayList<Eye> eyes = new ArrayList<Eye>();

void setup(){
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  for(int i=0; i<10; i++){
    eyes.add(new Eye(200, 100, 50, new PVector(random(width), random(height))));
  }
  noStroke();
}

void draw(){
  background(300);
  PVector target = new PVector(mouseX, mouseY);
  for(Eye eye : eyes){
    eye.show(target);
  }
}

class Eye{
  float r1;
  float r2;
  float r3;
  PVector origin = new PVector(width/2, height/2);
  
  Eye(float r1, float r2, float r3, PVector origin){
    this.r1 = r1;
    this.r2 = r2;
    this.r3 = r3;
    this.origin = origin;
  }
  
  void show(PVector target){
    fill(360);
    ellipse(origin.x, origin.y, r1, r1);
    fill(40, 100, 80);
    PVector diff = PVector.sub(target, origin);
    PVector pos = PVector.add(origin, diff.setMag(constrain(diff.mag(), 0, (r1-r2)/2)));
    ellipse(pos.x, pos.y, r2, r2);
    fill(0);
    ellipse(pos.x, pos.y, r3, r3);
  }
}
