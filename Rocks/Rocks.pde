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
  
  PImage image;
  double xV, yV;
  float size;
  boolean xDirection, yDirection;
  
  Ball(float x, float y) {
    super(x, y);
    xV = 1;
    yV = 1;
    xDirection = true;
    yDirection = true;
    int random = (int)(Math.random() * 5);
    switch(random) {
      case 0:
        image = loadImage("tabletennis.png");
        size = 5;
        break;
      case 1:
        image = loadImage("basketball.png");
        size = 50;
        break;
      case 2:
        image = loadImage("tennisball.png");
        size = 20;
        break;
    }
  }

  void display() {
    /* ONE PERSON WRITE THIS */
    image(image, x, y, size, size);
  }

  void move() {
    if(x >= 1000 - size) {
      xDirection = true;
    } else if(x < 0) {
      xDirection = false;
    }
    if(y >= 800 - size) {
      yDirection = true;
    } else if(y < 0) {
      yDirection = false;
    }
    if(xDirection) {
       x -= random(5);
    } else {
      x += random(5);
    }
    if(yDirection) {
       y -= random(5);
    } else {
       y += random(5);
    }
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
