void keyPressed() {
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == ' ') spacekey = true;
  if (keyCode == 'q' || keyCode == 'Q') qkey = true;
  if (keyCode == 'w' || keyCode == 'W') wkey = true;
  if (keyCode == 'a' || keyCode == 'A') akey = true;
  if (keyCode == 's' || keyCode == 'S') skey = true;
  if (keyCode == 'd' || keyCode == 'D') dkey = true;
  if (keyCode == 'e' || keyCode == 'E') ekey = true;
}


void keyReleased() {
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == ' ') spacekey = false;
  if (keyCode == 'q' || keyCode == 'Q') qkey = false;
  if (keyCode == 'w' || keyCode == 'W') wkey = false;
  if (keyCode == 'a' || keyCode == 'A') akey = false;
  if (keyCode == 's' || keyCode == 'S') skey = false;
  if (keyCode == 'd' || keyCode == 'D') dkey = false;
  if (keyCode == 'e' || keyCode == 'E') ekey = false;

}
