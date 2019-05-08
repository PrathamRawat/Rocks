interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

interface Collideable{
  boolean isTouching(Thing other);
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
  PImage img;
  Rock(float x, float y, PImage pic2) {
    super(x, y);
    img = pic2;
  }

  void display() {
    image(img,x,y,50,50);
  }
}

public class LivingRock extends Rock implements Moveable {
  boolean direction, direction2;
  PImage img1;
  float t1,t2;
  LivingRock(float x, float y, PImage pic,PImage pic3) {
    super(x, y, pic3);
    direction = true;
    direction2 = true;
    img1 = pic;
  }
  void display(){
    super.display();
    image(img1,x+20,y+5,20,20);
  }
  void move() {
    if(x>= 1000) direction = false;
    else if(x<=0) direction = true;
    if(direction){
    x+=5;
    }
    else x-=5;
    
    if(y>= 800) direction2 = false;
    else if(y<=0) direction2 = true;
    if(direction2){
      y+=5;
    }
    else y-=5;
  }
}

class Ball extends Thing implements Moveable, Collideable {
  
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
      case 3:
        image = loadImage("pokeball.png");
        size = 30;
        break;
      case 4:
        image = loadImage("poloball.png");
        size = 45;
        break;
    }
  }
  
  boolean isTouching(Thing other){
    return false;
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
  PImage image10 = loadImage("eyes2.png");
  PImage image11 = loadImage("rock.png");
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  for (int i = 0; i < 10; i++) {
    Ball b = new Ball(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    Rock r = new Rock(50+random(width-100), 50+random(height-100),image11);
    thingsToDisplay.add(r);
  }
  for (int i = 0; i < 3; i++) {
    LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100),image10,image11);
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