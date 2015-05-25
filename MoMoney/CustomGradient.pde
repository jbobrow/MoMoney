import java.util.Collections;
/*
 *  In search of a complex linear gradient? look no further.
 *  This class creates a custom gradient which can add any number
 *  of colors along the normalized path 0.0 to 1.0, which will return
 *  the correct color when interpolating across the entire palette.
 *
 */


// class for holding colors and normalized locations
class ColorNode implements Comparable<ColorNode> {
  color c;
  float loc;
  
  ColorNode(color c, float loc) {
    this.c = c;
    this.loc = loc;
  }
  
  public int compareTo(ColorNode node) 
  { 
    if(this.loc < node.loc)
      return -1;
    else if(this.loc == node.loc)
      return 0;
    else
      return 1;

      //return this.loc - node.loc; 
  } 
}

// class for creating gradients with nodes in between
class CustomGradient {
  
  ArrayList<ColorNode> colorNodes;
    
  CustomGradient(){
    colorNodes = new ArrayList<ColorNode>();
  } 

  CustomGradient(color start, color end){
    colorNodes = new ArrayList<ColorNode>();
    colorNodes.add(new ColorNode(start, 0.0));
    colorNodes.add(new ColorNode(end, 1.0));
  } 

  CustomGradient(ArrayList<ColorNode> nodes){
    colorNodes = new ArrayList<ColorNode>(nodes);    
  } 
  
  void setStart(color c){
    addColor(c, 0.0);
  }
  
  void setEnd(color c){
    addColor(c, 1.0);
  }

  void addColor(color c, float loc){
    if( 0.0 <= loc && loc <= 1.0 )
      colorNodes.add(new ColorNode(c, loc));
    else
      println("color location is not normalized. NOT ADDED TO CUSTOM GRADIENT");
      
    sortColorNodes();  // sort after adding a color
  }

  color getColor(float loc){

    // return ends
    if( loc == 0.0 )
      return colorNodes.get(0).c;
    else if ( loc == 1.0 )
      return colorNodes.get(colorNodes.size()-1).c;
      
    ColorNode cn1 = getLower(loc);
    ColorNode cn2 = getUpper(loc);
    float lerpVal = map(loc, cn1.loc, cn2.loc, 0.0, 1.0);
    color c = lerpColor(cn1.c, cn2.c, lerpVal);
    // only for debug purposes
    //println("getColor: " + loc + " returns: " + red(c) + ", " + green(c) + ", " + blue(c));
    return c; 
  }
  
  ColorNode getUpper(float loc){
    ColorNode c = new ColorNode(color(0,0,0), 1.0);

    for(int i=0; i<colorNodes.size(); i++){
      ColorNode cn = colorNodes.get(i);
      if(cn.loc >= loc)
        return cn;
    }
    
    return c;
  }
  
  ColorNode getLower(float loc){
    ColorNode c = new ColorNode(color(0,0,0), 0.0);

    for(int i=colorNodes.size()-1; i>=0; i--){
      ColorNode cn = colorNodes.get(i);
      if(cn.loc < loc)
        return cn;
    }
    
    return c;
  }
  
  void sortColorNodes(){
    Collections.sort(colorNodes);  // need to use a different sort method if not java
    // only for debug purposes
    //    println("-----------------");
    //    for(int i=0; i<colorNodes.size(); i++){
    //      ColorNode cn = colorNodes.get(i);
    //      println("position: "+cn.loc);
    //    }
  }
}
