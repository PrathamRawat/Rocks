interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

abstract class Thing implements Displayable {
  float x, y;//Position of the Thing

  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  abstract void display();
}

class Rock extends Thing {
  Rock(float x, float y) {
    super(x, y);
  }

  void display() {
    fill(128,128,128);
    ellipse(x, y, 20, 20);
  }
}

public class LivingRock extends Rock implements Moveable {
  boolean direction, direction2;
  LivingRock(float x, float y) {
    super(x, y);
    direction = true;
    direction2 = true;
  }
  void move() {
    if(x>= 1000) direction = false;
    else if(x<=0) direction = true;
    if(direction){
    x+=random(5);
    }
    else x-=random(5);
    
    if(y>= 800) direction2 = false;
    else if(y<=0) direction2 = true;
    if(direction2){
      y+=random(5);
    }
    else y-=random(5);
  }
}

class Ball extends Thing implements Moveable {
<<<<<<< HEAD
  double xV, yV;
  Ball(float x, float y) {
    super(x, y);
    xV = 1;
    yV = 1;

=======
  PImage image;
  
  Ball(float x, float y) {
    super(x, y);
    image = loadImage("tabletennis.png");
  }

  void display() {
    /* ONE PERSON WRITE THIS */
    image(image, x, y, 20, 20);
  }

  void move() {
     boolean move = true;
    if (x >= 500 && move){
      xV -= (Math.random() * 5);
    }
    else{
      xV = (Math.random() * 5);
    }
    if (y >= 500 && move){
      yV -= (Math.random() * 5);
    }
    else{
      yV = (Math.random() * 8);
    }
    if (x % 2 == 0){
      move = false;
    }
    x += xV;
    y += yV;
  }
}

/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;

void setup() {
  size(1000, 800);

  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  for (int i = 0; i < 10; i++) {
    Ball b = new Ball(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    Rock r = new Rock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(r);
  }
  for (int i = 0; i < 3; i++) {
    LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(m);
    thingsToMove.add(m);
  }
}
void draw() {
  background(255);

  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
  }
}