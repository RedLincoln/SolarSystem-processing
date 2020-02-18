PImage sunImage, earthImage, mercuryImage, galaxyImage, venusImage, marsImage;
PShape sun, earth, mercury, venus, mars;

int planetSize = 50;
int sunSize = 100;
float ratioEarthMercury = 365.0 / 88.0;
float ratioEarthVenus = 365.0 / 224.7;
float ratioEarthMars = 365.0 / 687.0;
float baseRotation = 0.25;
float sunRotation = baseRotation;
float earthRotation = baseRotation;
float mercuryRotation = baseRotation * ratioEarthMercury;
float venusRotation = baseRotation * ratioEarthVenus;
float marsRotation = baseRotation * ratioEarthMars;


void setup(){
   fullScreen(P3D);
   loadImages();
   galaxyImage.resize(width, height);
   earth = createShape(SPHERE, planetSize);
   mercury = createShape(SPHERE, planetSize);
   venus = createShape(SPHERE, planetSize);
   mars = createShape(SPHERE, planetSize);
   sun = createShape(SPHERE, sunSize);
   sun.setTexture(sunImage);
   earth.setTexture(earthImage);
   mercury.setTexture(mercuryImage);
   venus.setTexture(venusImage);
   mars.setTexture(marsImage);
   mars.setStroke(color(255, 0));
   sun.setStroke(color(255, 0));
   earth.setStroke(color(255, 0));
   venus.setStroke(color(255, 0));
   mercury.setStroke(color(255, 0));
}

void loadImages(){
  sunImage = loadImage("sun.jpg");
  earthImage = loadImage("earth.jpg");
  mercuryImage = loadImage("mercury.jpg");
  galaxyImage = loadImage("galaxy.jpg");
  venusImage = loadImage("venus.jpg");
  marsImage = loadImage("mars.jpg");
}

void draw(){
  background(galaxyImage);
  translate(width / 2, height / 2);
  rotateX(radians(45));
  
  pushMatrix();
  rotateY(radians(sunRotation));
  shape(sun); 
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(mercuryRotation));
  translate(0, -175);
  rotateY(radians(mercuryRotation));
  shape(mercury);
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(venusRotation));
  translate(0, -225);
  rotateY(radians(venusRotation));
  shape(venus);
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(earthRotation));
  translate(0, -275);
  rotateY(radians(earthRotation));
  shape(earth);
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(marsRotation));
  translate(0, -325);
  rotateY(radians(marsRotation));
  shape(mars);
  popMatrix();
  
  pushMatrix();
  stroke(255);
  circle(0, 0, 550);
  circle(0, 0, 350);
  circle(0, 0, 450);
  circle(0, 0, 650);
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
  marsRotation += baseRotation * ratioEarthMars;
}
