Boolean bDrawOne = false;
Boolean bClearBk = false;
int sizeRectClearBk = 2;
float scale = 30;
PVector pos;
float dimRectW, dimRectH;

//modes
Boolean bModeDragged = true;


void setup() {

  size(1280, 720);

  //stroke(i, j, 100);
  colorMode(HSB, 100);


  background(10);
  dimRectW = 4*scale;
  dimRectH = 7*scale;
  pos = new PVector(mouseX, mouseY);
}

void draw() {
  mouseMoved();
  noFill();

  if (bClearBk) {
    background(10);
    bClearBk = false;
  } else {
    strokeWeight(sizeRectClearBk);
    if (bModeDragged) {
      //stroke(0,255,0);
      stroke(0, 100, 100);
      rect(0, 0, 40, 40);
    } else {
      //stroke(255,0,0);
      stroke(0, 0, 100);//green hsv?
      rect(0, 0, 40, 40);
    }
  }

  if (bDrawOne) {

    //rgb
    //stroke(200,200,200);
    //stroke(random(100,214), random(100,214), random(100,214));

    //hsv
    stroke(random(100), random(100), 100);
    strokeWeight(random(3, 4));
    pos.x = mouseX-dimRectW*0.5;
    pos.y = mouseY-dimRectH*0.5;
    rect(pos.x, pos.y, dimRectW, dimRectH);
    bDrawOne = false;
  }
}


void mouseReleased() {
  if (!bModeDragged)bDrawOne = true;

  if (mouseX < 80) {
    if (mouseY < 80) {
      //bClearBk = true;
      bModeDragged = !bModeDragged;
      bDrawOne = false;
    }
  }
}

void mouseMoved() {
  if (mouseX < 40) {
    if (mouseY < 40) {
      sizeRectClearBk = 4;
    } else sizeRectClearBk = 2;
  } else sizeRectClearBk = 2;
}
void mouseDragged() {
  if (bModeDragged)bDrawOne = true;
}

void keyPressed() {
  if (key == ' ') {
    bClearBk = true;
  }
}
