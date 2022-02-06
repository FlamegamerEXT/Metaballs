int maxRatio = 4, exponent = 4;
float minValue = pow(exponent, 1 - maxRatio);

public class Ball {
  float posX, posY, velX, velY, radius;
  
  public Ball(float x, float y, float v, float r){
    posX = x;
    posY = y;
    float angle = random(TWO_PI);
    velX = abs(v)*cos(angle);
    velY = abs(v)*sin(angle);
    radius = abs(r);
    
  }
  
  /** Returns this ball's x-position */
  public float getX(){
    return posX;
  }
  
  /** Returns this ball's y-position */
  public float getY(){
    return posY;
  }
  
  /** Returns this ball's radius */
  public float getRadius(){
    return radius;
  }
  
  /** Moves the ball forward one step */
  public void step(){
    posX += velX;
    posY += velY;
  }
  
  /** Changes the direction of the ball's velocity to
    * being away from the given bpundary */
  public void reflect(String c){
    switch (c) {
      case "n":  // Reflect off of North boundary
        posY -= velY;
        velY = abs(velY);
        posY += velY;
        break;
      case "e":  // Reflect off of East boundary
        posX -= velX;
        velX = -abs(velX);
        posX += velX;
        break;
      case "s":  // Reflect off of South boundary
        posY -= velY;
        velY = -abs(velY);
        posY += velY;
        break;
      case "w":  // Reflect off of West boundary
        posX -= velX;
        velX = abs(velX);
        posX += velX;
        break;
      default:
        break;
    }
    
  }
  
  /** Returns a value between 0 and exponent, with respect to the distance to it's centre */
  public float getValue(float x, float y){
    float distance = pow(pow(posX-x, 2) + pow(posY-y, 2), 0.5);
    if (distance > radius*maxRatio) { return 0; }  // Reduces complexity, as calculating and exponetial takes a while
    return pow(exponent, 1 - distance/radius)-minValue;
  }
}
