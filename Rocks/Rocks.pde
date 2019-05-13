interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

interface Collideable{
  boolean isTouching(Thing other);
}

abstract class Thing implements Displayable, Collideable {
  float x, y;//Position of the Thing
  
  

  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  boolean isTouching(Thing other){
    if (dist(x,y,other.x,other.y) <= (32)){ // distance formula
      return true;
    }
    else{
      return false;
    }
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
     noTint();
    image(img,x,y,50,50);
  }
}

public class LivingRock extends Rock implements Moveable {
  boolean direction, direction2;
  PImage img1;
  float t1,t2;
  float r,q;
  LivingRock(float x, float y, PImage pic,PImage pic3) {
    super(x, y, pic3);
    direction = true;
    direction2 = true;
    img1 = pic;
    r = random(360);
    q = random(360);
  }
  void display(){
    super.display();
    image(img1,x+20,y+5,20,20);
  }
  void move() {
    if(x>= 1000) direction = false;
    else if(x<=0) direction = true;
    if(direction){
    r+=.1;
    x= 100*cos(r/2) + 2*r;
    }
    else{
      r-=.1;
      x= 100*cos(r/2) + 2*r;
    }
    
    if(y>= 800) direction2 = false;
    else if(y<=0) direction2 = true;
    if(direction2){
      q+=.1;
      y = 100*sin(q/2) + 2*q ;
    }
    else{
      q-=.1;
      y = 100*sin(q/2) + 2*q;
    }
  }
}

class Ball extends Thing implements Moveable {
  
  PImage image;
  double xV, yV;
  float size;
  boolean xDirection, yDirection;
  
  Ball(float x, float y, PImage image, float size) {
    super(x, y);
    xV = 1;
    yV = 1;
    xDirection = true;
    yDirection = true;
    this.image = image;
    this.size = size;
  }
  


  void display() {
    /* ONE PERSON WRITE THIS */
    noTint();
    for( Collideable c : ListOfCollideables) {
       if (c.isTouching(this)){
         tint(255,0,0);
       }
       else{
         
    }
    image(image, x, y, size, size);
  }
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

class OddBall extends Ball {
  
  float xVel;
  float yVel;
  
  OddBall(float x, float y, PImage image, float size) {
    super(x, y, image, size);
    xVel = 5;
    yVel = 5;
  }
  
  void move() {
    if(x >= 1000 - size || x < 0) {
      xVel *= -1;
      yVel = random(15) - 7;
    }
    if(y >= 800 - size || y < 0) {
      yVel *= -1;;
      xVel = random(15) - 7;
    }
    x += xVel;
    y += yVel;
  }
  
}

/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
ArrayList<Collideable> ListOfCollideables;

void setup() {
  size(1000, 800);
  PImage image10 = loadImage("eyes2.png");
  PImage image11 = loadImage("rock.png");
  PImage image0 = loadImage("tabletennis.png");
  PImage image1 = loadImage("basketball.png");
  PImage image2 = loadImage("tennisball.png");
  PImage image3 = loadImage("pokeball.png");
  PImage image4 = loadImage("poloball.png");
  PImage image5 = loadImage("football.png");
  PImage image6 = loadImage("rugbyball.png");
  PImage image7 = loadImage("spikeyball.png");
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  ListOfCollideables = new ArrayList<Collideable>();
  for (int i = 0; i < 10; i++) {
    Ball b = null;
    switch((int)(Math.random() * 5)) {
      case 0:
        b = new Ball(50+random(width-100), 50+random(height-100), image0, 5);
        break;
      case 1:
        b = new Ball(50+random(width-100), 50+random(height-100), image1, 50);
        break;
      case 2:
        b = new Ball(50+random(width-100), 50+random(height-100), image2, 10);
        break;
      case 3:
        b = new Ball(50+random(width-100), 50+random(height-100), image3, 15);
        break;
      case 4:
        b = new Ball(50+random(width-100), 50+random(height-100), image4, 7.5);
        break;
    }
    OddBall ob = null;
    switch((int)(Math.random() * 3)) {
      case 0:
        ob = new OddBall(50+random(width-100), 50+random(height-100), image5, 40);
        break;
      case 1:
        ob = new OddBall(50+random(width-100), 50+random(height-100), image6, 40);
        break;
      case 2:
        ob = new OddBall(50+random(width-100), 50+random(height-100), image7, 5);
        break;
    }
    thingsToDisplay.add(b);
    thingsToDisplay.add(ob);
    thingsToMove.add(b);
    thingsToMove.add(ob);
    Rock r = new Rock(50+random(width-100), 50+random(height-100),image11);
    thingsToDisplay.add(r);
    ListOfCollideables.add(r);
  }
  for (int i = 0; i < 3; i++) {
    LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100),image10,image11);
    thingsToDisplay.add(m);
    thingsToMove.add(m);
    ListOfCollideables.add(m);
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
