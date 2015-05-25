float EASE = 0.05;

class Label {
 
  String name;
  float value;
  PVector pos, target_pos;
  
  Label(String name, float value) {
    this.name = name;
    this.value = value;
    pos = new PVector();
    target_pos = new PVector();
  }
  
  void setPosition(PVector pos){
    this.pos.x = pos.x;
    this.pos.y = pos.y;
  }

  void setPosition(float x, float y){
    this.pos.x = x;
    this.pos.y = y;
  }
  
  PVector getPosition() {
    return pos; 
  }
  
  void update() {
    pos.x = pos.x + EASE * (target_pos.x - pos.x);
    pos.y = pos.y + EASE * (target_pos.y - pos.y);
  }

  void display() {
    text(name, pos.x, pos.y);
  } 
}
