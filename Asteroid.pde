class Asteroid extends Floater
{
  private double speedOfRotation, dRadians;
  private float radius;
  
  Asteroid(){
    speedOfRotation = (int)(Math.random()*2+4);
    corners = (int)(Math.random()*4)+6;  
    xCorners = new int[corners];
    yCorners = new int[corners];
    radius = (int)(Math.random()*20+10);
    for (int i = 0; i < corners; i++){
      double angle = Math.random()*((Math.PI*2)/corners)+((Math.PI*2)/corners*i);
      xCorners[i] = (int)(Math.cos(angle)*radius);
      yCorners[i] = (int)(Math.sin(angle)*radius);
    }
    myColor = color(255, 255, 255);   
    myCenterX = (int)(Math.random()*451);
    myCenterY = 0; 
    myPointDirection = (int)(Math.random()*361); 
    dRadians = myPointDirection*(Math.PI/180); 
    myXspeed = Math.cos(dRadians);
    myYspeed = Math.sin(dRadians); 
  }
  
  Asteroid(double direction, double x, double y, float size){
    speedOfRotation = (int)(Math.random()*2+4);
    corners = (int)(Math.random()*4)+6;  
    xCorners = new int[corners];
    yCorners = new int[corners];
    radius = size/1.5;
    for (int i = 0; i < corners; i++){
      double angle = Math.random()*((Math.PI*2)/corners)+((Math.PI*2)/corners*i);
      xCorners[i] = (int)(Math.cos(angle)*radius); 
      yCorners[i] = (int)(Math.sin(angle)*radius);
    }
    myColor = color(255, 255, 255);   
    myCenterX = x;
    myCenterY = y; 
    myPointDirection = direction;
    dRadians = myPointDirection*(Math.PI/180); 
    myXspeed = Math.cos(dRadians);
    myYspeed = Math.sin(dRadians);
  }
  
  public void move(){
    turn(speedOfRotation);
    super.move();
  }
  
  public double getX(){
    return myCenterX;
  }
  
  public double getY(){
    return myCenterY;
  }
  
  public float getRadius(){
    return radius;
  }
  
  public double getDirection(){
    return myPointDirection;
  }
  
}
