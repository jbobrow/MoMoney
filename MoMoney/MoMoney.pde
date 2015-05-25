// Salary vs. Misogyny
//
//  Inspired by the work of Ben Fry w/ Salary vs. Performance
//  This data visualization will look for correlation between use of
//  certain language and a hip hop artist's income. While it would
//  be ridiculous to take these stats as a direct correlation or or causation
//  I am curious to see what the correlation might be, if there is any,
//  and the kind of discussion it might spark if there is a correlation.
//  Best case scenario, rappers that respect women in their lyrics make
//  more money. Worst case scenario, the opposite would be true.
//
//  public data source: https://docs.google.com/spreadsheets/d/1qyoUdP1MKHbZ4j5KP4rXLQWzU4j15b_Svu4SvqS5W3M/edit?usp=sharing
//  source + info: https://github.com/jbobrow/MoMoney
//
//  Initial concept inspired by MisogynyStats.com
//  created by Mehan Jaayasuriya, @mehan_j
//  www.mehan.info
//
//  by Jonathan Bobrow, @jonathanbobrow
//  www.jonathanbobrow.com
//  May 19, 2015
//  

JSONObject data;

ArrayList artists;

ArrayList coins;

CustomGradient cg;

void setup() {
  
  size(1200, 700, P2D);
    
  data = loadJSONObject("data.json");
  
  artists = new ArrayList();
  
  coins = new ArrayList();
  
  cg = new CustomGradient();  // create a new custom gradient
  cg.addColor(color(0,0,0), 1.0);  // add colors to the gradient from 0 to 1
  cg.addColor(color(0,0,200), 0.875);
  cg.addColor(color(175,0,220), 0.750);
  cg.addColor(color(220,0,0), 0.600);
  cg.addColor(color(255,255,0), 0.175);
  cg.addColor(color(255,255,255), 0.050);
  cg.addColor(color(255,255,255), 0.0);

  // load artist data
  JSONArray root = data.getJSONArray("MoMoneyStats");
  for(int i=0; i<root.size(); i++) {
    JSONObject artist_data = root.getJSONObject(i);
    artists.add(new Artist(artist_data));
  }
  
  //test print the data
//  for(int i=0; i<artists.size(); i++) {
//    Artist a = (Artist) artists.get(i);
//    a.printDetails();
//  }
  
  // make coins
  for(int i=0; i<artists.size(); i++) {
    Artist a = (Artist) artists.get(i);
    coins.add(new Coin(a));
  }
  
}

void draw() {
  background(220);
  
  for(int i=0; i<coins.size(); i++) {
    Coin c = (Coin) coins.get(i);
    c.update();
    c.display();
  }
}

void sortByWorth() {
  for(int i=0; i<coins.size(); i++) {
    Coin c = (Coin) coins.get(i);
    c.setPosition(200 + 300*i, height/2);
  }
}

void sortByMisogyny() {
  for(int i=0; i<coins.size(); i++) {
    Coin c = (Coin) coins.get(i);
    c.setPosition((coins.size() - i) * 300, height/2);
  }
}

void keyPressed() {
  switch(key) { 
    case '1': sortByWorth(); break;
    case '2': sortByMisogyny(); break;
    default: break;
  }
}
