// create a circular representation of the artist and their values

class Coin {
  
  Artist artist;
  PVector pos, target_pos;
  float radius;
  color fill_color;
  
  Coin(Artist a) {
    artist = a;
    pos = new PVector(0,0);
    target_pos = new PVector(0,0);
    radius = 200 * sqrt(sqrt(artist.net_worth / 80000000.0));
    float c = (artist.total_count / 400.0);
    fill_color = cg.getColor(c);
  }
  
  void setPosition(PVector pos){
    target_pos.x = pos.x;
    target_pos.y = pos.y;
  }

  void setPosition(float x, float y){
    target_pos.x = x;
    target_pos.y = y;
  }
  
  PVector getPosition() {
    return pos; 
  }
  
  void update() {
    pos.x = pos.x + EASE * (target_pos.x - pos.x);
    pos.y = pos.y + EASE * (target_pos.y - pos.y);
  }

  void display() {
    noStroke();
    fill(fill_color);
    ellipse(pos.x, pos.y, radius, radius);
//    textMode(CENTER);
    fill(255);
    text(artist.name, pos.x, pos.y);
  } 
}
