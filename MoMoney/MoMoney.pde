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

void setup() {

  data = loadJSONObject("data.json");
  
  artists = new ArrayList();

  // load artist data
  JSONArray root = data.getJSONArray("MoMoneyStats");
  for(int i=0; i<root.size(); i++) {
    JSONObject artist_data = root.getJSONObject(i);
    artists.add(new Artist(artist_data));
  }
  
  //test print the data
  for(int i=0; i<artists.size(); i++) {
    Artist a = (Artist) artists.get(i);
    a.printDetails();
  }
}
