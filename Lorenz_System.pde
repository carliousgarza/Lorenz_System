import peasy.*;

float x = 1;
float y = 0;
float z = 0;

//First type
//float a = 10;      //o
//float b = 28;      //p
//float c = 8.0/3.0; //Beta

//Second type
//float a = 10;      //o
//float b = 14;      //p
//float c = 8.0/3.0; //Beta

////Third type
//float a = 10;      //o
//float b = 13;      //p
//float c = 8.0/3.0; //Beta

//Fourth type
float a = 10;      //o
float b = 15;      //p
float c = 8.0/3.0; //Beta

ArrayList<PVector> points = new ArrayList<PVector>();

PeasyCam camera;

void setup() {
  size(800, 600, P3D);
  colorMode(HSB);
  camera = new PeasyCam(this, 500);
}

void draw() {
  background(0, 0, 0);
  float dt = 0.01;
  float dx = (a * (y - x)) * dt;
  float dy = (x * (b - z) - y) * dt;
  float dz = ((x * y) - c * z) * dt;
  y = y + dy;
  x = x + dx;
  z = z + dz;

  points.add(new PVector(x, y, z));

  translate(0, 0, -80);
  scale(5);
  stroke(255);
  noFill();

  float hue = 0;
  beginShape();
  for (PVector v : points) {
    stroke(hue++, 255, 255);
    vertex(v.x, v.y, v.z);
    if (hue>255) {
      hue=0;
    }
  }
  endShape();
}
