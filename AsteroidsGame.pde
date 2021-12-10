Spaceship bob;
Star [] jeff = new Star[100];

ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();
ArrayList <Bullets> ammo = new ArrayList <Bullets>();
boolean right, left, accelerate, shoot;
int health;
int hit, score, high_score;

void setup(){
  size(500, 500);
  bob = new Spaceship();
  for (int i = 0; i < jeff.length; i++){
    jeff[i] = new Star();
  }
  for (int i = 0; i < 10; i++){
    rocks.add(new Asteroid());
  }  
  score = 0;
  high_score = 0;
}

void draw(){
  background(0);
  
  if (high_score < score){
    high_score =score;
  }
  
  for (int i = 0; i < jeff.length; i++){
    jeff[i].show();
  }
  if (left){
    bob.turn(-5);
  } if (right){
    bob.turn(5);
  } if (accelerate){
    bob.accelerate(.05);
  }
  bob.move();
  bob.show();
  
  for (int i = 0; i < rocks.size(); i++){
    rocks.get(i).move();
    rocks.get(i).show();
    float d = dist((float)bob.getX(), (float)bob.getY(), (float)rocks.get(i).getX(), (float)rocks.get(i).getY());
    if (d < rocks.get(i).getRadius()){
      rocks.remove(i);
      rocks.add(new Asteroid());
      hit += 1;
    }
   }
   for (int x = 0; x < ammo.size(); x++){
     for (int y = 0; y < rocks.size(); y++){
       float e = dist((float)ammo.get(x).getX(), (float)ammo.get(x).getY(), (float)rocks.get(y).getX(), (float)rocks.get(y).getY());
       if (e < rocks.get(y).getRadius()){
         if (rocks.get(y).getRadius()> 20){
           rocks.add(new Asteroid(rocks.get(y).getDirection() + 6, rocks.get(y).getX(), rocks.get(y).getY(), rocks.get(y).getRadius()));
           rocks.add(new Asteroid(rocks.get(y).getDirection() - 6, rocks.get(y).getX(), rocks.get(y).getY(), rocks.get(y).getRadius()));
         } else {
           if (rocks.get(y).getRadius() > 13){
             rocks.add(new Asteroid()); 
           }
         }
       rocks.remove(y);
       score += 10;
       ammo.get(x).setHit(true);
       }
     }
     if (ammo.get(x).getHit() ==  true){
      ammo.remove(x);
     }
   }
  for (int i = 0; i < ammo.size(); i++){
    ammo.get(i).move();
    ammo.get(i).show(); 
    if (ammo.get(i).getX() > 480 || ammo.get(i).getX() < 20 || ammo.get(i).getY() > 480 || ammo.get(i).getY() < 20){
    ammo.remove(i);
    }
  }
  
  if (hit == 0){
    health = 30;
  } else if (hit == 1){
    health = 20;
  } else if (hit == 2){
    health = 10;
  } else if (hit == 3){
    health = 30;
    hit = 0;
    score = 0;
  }
  
  fill(0, 255, 0);
  rect((float)bob.myCenterX - 10, (float)bob.myCenterY - 20, health, 4);
  textSize(20);
  textAlign(CENTER);
  text(score, 175, 50);
  text(high_score, 325, 50);
  textSize(15);
  text("High Score", 325, 25);
  text("Score", 175, 25);
  
  if (high_score > 1750){
    bob.setColor(color(255, 0, 255));
  } else if (high_score > 1500){
    bob.setColor(color(127, 0, 255));
  } else if (high_score > 1250){
    bob.setColor(color(0, 0, 255));
  } else if (high_score > 1000){
    bob.setColor(color(0, 255, 0));
  } else if (high_score > 750){
    bob.setColor(color(255, 255, 0));
  } else if (high_score > 500){
    bob.setColor(color(255, 128, 0));
  } else if (high_score > 250){
    bob.setColor(color(255, 0, 0));
  }
}

public void keyPressed(){
  System.out.println(keyCode);
  if (keyCode == 37){
    //bob.turn(-5);
    left = true;
  } if (keyCode == 39){
    //bob.turn(5);
    right = true;
  } if (keyCode == 38){
    //bob.accelerate(.1);
    accelerate = true;
  } if (keyCode == 40){
    bob.myCenterX = (int)(Math.random()*501);
    bob.myCenterY = (int)(Math.random()*501);
    bob.myXspeed = 0;
    bob.myYspeed = 0;
    bob.myPointDirection = (int)(Math.random()*361);
  }
 }

 

public void keyReleased(){
  if (keyCode == 37){
    left = false;
  } if (keyCode == 39){
    right = false;
  } if (keyCode == 38){
    accelerate = false;
  }
  if (keyCode == 32){
    ammo.add(new Bullets());
    score -= 1;
  }
 }

class Bullets extends Floater{
  double dRadians;
  boolean hit;
  Bullets(){
    myCenterX = bob.getX();
    myCenterY = bob.getY(); 
    myPointDirection = bob.getDirection();
    dRadians = myPointDirection*(Math.PI/180); 
    myXspeed = Math.cos(dRadians) * 8;
    myYspeed = Math.sin(dRadians) * 8;
    hit = false;
  }
  public void show(){
    ellipse((float)myCenterX, (float)myCenterY, 5, 5);
  } 
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
  public void setHit(boolean Hit){
    hit = Hit;
  }
  
  public boolean getHit(){
    return hit;
  }
}
