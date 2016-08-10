Point[] stars;

boolean keyLeft = false;
boolean keyRight = false;
boolean keySpace = false;

float playerX, playerY;
Ship ship = new Ship();
Laser laser = new Laser();

float referenceX, referenceY, referenceSpeed;
Enemy enemies[];
int enemiesCount;

void setup() {
  size(1024, 768);

  stars = new Point[100];
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Point(random(width), random(height));
  }

  enemies = new Enemy[30];
  enemiesCount = 30;
  for (int i=0; i<enemies.length; i++) {
    enemies[i]=new Enemy((i%10)*70, 70*(i/10));
  }

  playerX = width/2;
  playerY = height-50-5;

  referenceX = 100;
  referenceY = 200;
  referenceSpeed = 1;
}

void draw() {
  background(0, 0, 0);

  stroke(255, 255, 255);
  for (int i=0; i<stars.length; i++) {
    float speed=0;
    point(stars[i].x, stars[i].y);
    if (i%2==0) {
      speed = 0.4;
    } else {
      speed = 0.8;
    }
    stars[i].y = (stars[i].y + speed) % height;
  }

  text("RX "+referenceX+" ENEMIES "+enemiesCount, 10, 10);

  for (int i=0; i<enemies.length; i++) {
    enemies[i].draw();
  }

  if (keyLeft) {
    playerX = playerX - 10;
  }
  if (keyRight) {
    playerX = playerX + 10;
  }
  if (playerX < 25) {
    playerX = 25;
  }
  if (playerX > width-25) {
    playerX = width-25;
  }

  if (keySpace && !laser.fired) {
    laser.fire();
  }

  ship.draw();
  laser.draw();
  laser.update();
  
  for (int i=0; i<enemies.length; i++) {
    if(enemies[i].hit(laser.x, laser.y)) {
      laser.fired = false;
      break;
    }
  }

  referenceX = referenceX+referenceSpeed;
  if (referenceX<50 || referenceX>350) {
    referenceSpeed = -referenceSpeed;
    referenceY = referenceY+5;
  }
}

void keyPressed() {
  if (keyCode==LEFT) {
    keyLeft = true;
  }
  if (keyCode==RIGHT) {
    keyRight = true;
  }
  if (key==' ') {
    keySpace = true;
  }
}

void keyReleased() {
  if (keyCode == LEFT) {
    keyLeft = false;
  }
  if (keyCode == RIGHT) {
    keyRight = false;
  }
  if (key==' ') {
    keySpace = false;
  }
}