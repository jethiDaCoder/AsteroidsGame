Spaceship bob;
Star [] jeff = new Star[100];

boolean right, left, accelerate;

void setup(){
  size(500, 500);
  bob = new Spaceship();
  for (int i = 0; i < jeff.length; i++){
    jeff[i] = new Star();
  }
}

void draw(){
  background(0);
  for (int i = 0; i < jeff.length; i++){
    jeff[i].show();
  }
  bob.move();
  bob.show();
  if (left){
    bob.turn(-5);
  } if (right){
    bob.turn(5);
  } if (accelerate){
    bob.accelerate(.05);
  }
}

public void keyPressed(){
  //System.out.println(keyCode);
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
}
