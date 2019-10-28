Boolean bMobileMode = false;

//PVector pointsPenta = new PVector();

float scale = 3;

PVector[] pointsPenta = new PVector[5]; // Declare, create

float radioCircle = 60;

float radioCircleBase = 60*scale;

int angleRotGeneral = 55;//invert pentagon 170;

//Diag

int strW_bk = 3;

int strW_fore = 5;

int endY;



//==============================================

void setup() {

  size(640, 360);
  
  if(bMobileMode == false){
    scale = 1;
    radioCircleBase = 60*scale;
  }else {
    scale = 3;
    radioCircleBase = 60*scale;
  }

  noFill();

  drawPolygon(0, 0, radioCircleBase, 5); // Penta

  ///

  colorMode(HSB, 100);

  frameRate(5);

  endY = height;

  /////

  createNewScene();
}

//==============================================

void createNewScene() {

  background(0, 0, 20);

  //radioCircle = radioCircleBase*2+20; //Circles in the pentagon...

  radioCircle = radioCircleBase*2;

  println("createNewScene with radioCircle = "+str(radioCircle));

  drawBkDiagonals();

  drawMyPoly();

  drawCirclesPoly();
}

//==============================================

void draw() {

  ///////////

  //All done just once at setup
}

//==============================================

void drawBkDiagonals() {

  noFill();

  //////

  int deltaDiagonal = height + height*2;

  float gapY = 30*scale;

  int initY = -deltaDiagonal;

  for (int y = initY; y < endY; y+=gapY) {

    stroke(random(0, 256), random(0, 256), 240);

    strokeWeight(strW_bk);

    line(0, y+deltaDiagonal, width, y);

    //line(0, y, width, y+deltaDiagonal);
  }

  /*

   endY += 10;
   
   if (endY > height) {
   
   endY = 0;
   
   }*/
}

//==============================================

void drawPolygon(float x, float y, float radius, int npoints) {

  float angle = TWO_PI / npoints;

  beginShape();

  int counter = 0;

  for (float a = 0; a < TWO_PI; a += angle) {

    float sx = x + cos(a) * radius;

    float sy = y + sin(a) * radius;

    vertex(sx, sy);

    PVector auxVec = new PVector(sx, sy);

    pointsPenta[counter] = auxVec;

    counter++;
  }

  endShape(CLOSE);
}

//==============================================

void drawCirclesPoly() {

  pushMatrix();

  translate(width*0.5, height*0.5);

  rotate(angleRotGeneral);

  for (int i=0; i<pointsPenta.length; i++) {

    stroke(100, 0, 100);

    fill(random(0, 200), random(0, 200), 200, 50);

    //circle(pointsPenta[i].x, pointsPenta[i].y, radioCircle);
    ellipse(pointsPenta[i].x, pointsPenta[i].y, radioCircle, radioCircle);
  }

  popMatrix();
} 

//==============================================

void drawMyPoly() {

  pushMatrix();

  translate(width*0.5, height*0.5);

  rotate(angleRotGeneral);

  stroke(100, 100, 0);

  noFill();

  beginShape();

  for (int i=0; i<pointsPenta.length; i++) {

    vertex(pointsPenta[i].x, pointsPenta[i].y);
  }

  endShape(CLOSE);

  popMatrix();
} 

//==============================================

void mousePressed() {

  radioCircle = map(mouseX, 0, width, radioCircleBase, radioCircleBase*2+20); 

  createNewScene();
}
