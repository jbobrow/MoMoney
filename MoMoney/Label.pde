class Label {
 
  String name;
  PVector pos, target_pos;
  
  Label(String name) {
    this.name = name;
  }
  
  void setPosition(PVector pos){
    
  }

  void setPosition(float x, float y){
  }
  
  PVector getPosition() {
    return pos; 
  }
  
  void update() {
  }

  void display() {
    text(name, pos.x, pos.y);
  } 
}
