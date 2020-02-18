PImage sunImage, earthImage, mercuryImage, galaxyImage, venusImage;
PShape sun, earth, mercury, venus;

float ratioEarthMercury = 365 / 88;
float ratioEarthVenus = 365 / 224.7;
float baseRotation = 0.25;
float sunRotation = baseRotation;
float earthRotation = baseRotation;
float mercuryRotation = baseRotation * ratioEarthMercury;
float venusRotation = baseRotation * ratioEarthVenus;


void setup(){
 fullScreen(P3D);
 sunImage = loadImage("sun.jpg");
 earthImage = loadImage("earth.jpg");
 mercuryImage = loadImage("mercury.jpg");
 galaxyImage = loadImage("galaxy.jpg");
 venusImage = loadImage("venus.jpg");
 galaxyImage.resize(width, height);
 earth = createShape(SPHERE, 20);
 sun = createShape(SPHERE, 50);
 sun.setTexture(sunImage);
 earth.setTexture(earthImage);
 sun.setStroke(color(255, 0));
 earth.setStroke(color(255, 0));
 mercury = createShape(SPHERE, 20);
 mercury.setTexture(mercuryImage);
 venus = createShape(SPHERE, 20);
 venus.setTexture(venusImage);
 endShape();
}

void draw(){
  background(galaxyImage);
  translate(width / 2, height / 2);
  pushMatrix();
  rotateY(radians(sunRotation));
  shape(sun); 
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(mercuryRotation));
  translate(0, -100);
  rotateY(radians(mercuryRotation));
  shape(mercury);
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(mercuryRotation));
  translate(0, -100);
  rotateY(radians(mercuryRotation));
  shape(mercury);
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(venusRotation));
  translate(0, -150);
  rotateY(radians(venusRotation));
  shape(venus);
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(earthRotation));
  translate(0, -200);
  rotateY(radians(earthRotation));
  shape(earth);
  popMatrix();
  
  pushMatrix();
  stroke(255);
  circle(0, 0, 400);
  circle(0, 0, 200);
  circle(0, 0, 300);
  noFill();
  rotateX(radians(90));
  popMatrix();
  
  updateRotateParams(); 
}

void updateRotateParams(){
  sunRotation += baseRotation;
  earthRotation += baseRotation;
  mercuryRotation += baseRotation * ratioEarthMercury;
  venusRotation += baseRotation * ratioEarthVenus;
}
