PImage sunImage, earthImage, mercuryImage, galaxyImage, venusImage, marsImage, moonImage, jupiterImage;
PShape sun, earth, mercury, venus, mars, moon, jupiter;

int planetSize = 50;
int moonSize = 10;
int sunSize = 100;
float ratioEarthMercury = 365.0 / 88.0;
float ratioEarthVenus = 365.0 / 224.7;
float ratioEarthMars = 365.0 / 687.0;
float ratioEarthMoon = 365 / 27.322; 
float ratioEarthJupiter = 1 / 11.8;
float baseRotation = 0.25;
float sunRotation = baseRotation;
float earthRotation = baseRotation;
float mercuryRotation = baseRotation * ratioEarthMercury;
float venusRotation = baseRotation * ratioEarthVenus;
float marsRotation = baseRotation * ratioEarthMars;
float moonRotation = baseRotation * ratioEarthMoon;
float jupiterRotation = baseRotation  * ratioEarthJupiter;

void settings(){
   fullScreen(P3D);
}

void setup(){
   loadImages();
   createShapes();
   addTextures();
   hideShapeStroke();
   textSize(30);
   textAlign(CENTER);
}

void createShapes(){
   moon = createShape(SPHERE, moonSize);
   earth = createShape(SPHERE, planetSize);
   mercury = createShape(SPHERE, planetSize);
   venus = createShape(SPHERE, planetSize);
   mars = createShape(SPHERE, planetSize);
   sun = createShape(SPHERE, sunSize);
   jupiter = createShape(SPHERE, planetSize);
}

void addTextures(){
   jupiter.setTexture(jupiterImage);
   moon.setTexture(moonImage);
   sun.setTexture(sunImage);
   earth.setTexture(earthImage);
   mercury.setTexture(mercuryImage);
   venus.setTexture(venusImage);
   mars.setTexture(marsImage);
}

void hideShapeStroke(){
   moon.setStroke(color(255, 0));
   mars.setStroke(color(255, 0));
   sun.setStroke(color(255, 0));
   earth.setStroke(color(255, 0));
   venus.setStroke(color(255, 0));
   mercury.setStroke(color(255, 0));
   jupiter.setStroke(color(255, 0));
}

void loadImages(){
   sunImage = loadImage("sun.jpg");
   earthImage = loadImage("earth.jpg");
   mercuryImage = loadImage("mercury.jpg");
   galaxyImage = loadImage("galaxy.jpg");
   venusImage = loadImage("venus.jpg");
   marsImage = loadImage("mars.jpg");
   moonImage = loadImage("moon.jpg");
   jupiterImage = loadImage("jupiter.jpg");
}

void draw(){
  galaxyImage.resize(width, height);
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
  text("Mercury", 0, 0, planetSize);
  rotateY(radians(mercuryRotation));
  shape(mercury);
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(venusRotation));
  translate(0, -275);
  text("Venus", 0, 0, planetSize);
  rotateY(radians(venusRotation));
  shape(venus);
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(earthRotation));
  translate(0, -375);
  text("Earth", 0, 0, planetSize);
  rotateY(radians(earthRotation));
  shape(earth);
  rotateZ(radians(moonRotation));
  translate(0, -70);
  rotateX(radians(moonRotation));
  shape(moon);
  popMatrix();
  
  pushMatrix();
  rotateZ(radians(marsRotation));
  translate(0, -475);
  text("Mars", 0, 0, planetSize);
  rotateY(radians(marsRotation));
  shape(mars);
  popMatrix();
  
  
  pushMatrix();
  rotateZ(radians(jupiterRotation));
  translate(0, -575);
  text("Jupiter", 0, 0, planetSize);
  rotateY(radians(jupiterRotation));
  shape(jupiter);
  popMatrix();
  
  pushMatrix();
  stroke(255);
  circle(0, 0, 750);
  circle(0, 0, 350);
  circle(0, 0, 550);
  circle(0, 0, 950);
  circle(0, 0, 1150);
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
  moonRotation += baseRotation * ratioEarthMoon;
  jupiterRotation += baseRotation  * ratioEarthJupiter;
}
