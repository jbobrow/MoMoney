class Artist {
// EXAMPLE DATA STRUCTURE
//    {
//      "name": "Dr. Dre",
//      "full_name": "Andre Romelle Young",
//      "birth_date": {
//        "weekday": "Thursday",
//        "month": "February",
//        "day": "18",
//        "year": "1965"
//      },      
//      "age": "49",
//      "misogyny": {
//        "bitch_count": "92",
//        "pussy_count": "6",
//        "ho_count": "56",
//        "overall_count": "154",
//        "src": "http://www.misogynystats.com/rappers/49"
//      },
//      "money": {
//        "net_worth": "800000000",
//        "yearly_income": "95545455",
//        "src": ""
//      }
//    }
  
  String name;
  String full_name;
  String misog_src;
  String worth_src;
  String birth_date;  // TODO: change this to a date object
  int birth_year;
  int age;
  int b_count, p_count, h_count, total_count;
  float net_worth;
  float yearly_income;
    
  Artist(JSONObject data) {
    name = data.getString("name");
    full_name = data.getString("full_name");
    age = data.getInt("age");
    
    // get bday data
    JSONObject bdy_obj = data.getJSONObject("birth_date");
    birth_year = bdy_obj.getInt("year");
    
    // get misogyny data
    JSONObject mis_obj = data.getJSONObject("misogyny");
    b_count = mis_obj.getInt("bitch_count");
    p_count = mis_obj.getInt("pussy_count");
    h_count = mis_obj.getInt("ho_count");
    total_count = mis_obj.getInt("overall_count");
    misog_src = mis_obj.getString("src");
    
    // get money data
    JSONObject mon_obj = data.getJSONObject("money");
    net_worth = mon_obj.getInt("net_worth");
    yearly_income = mon_obj.getInt("yearly_income");
    worth_src = mon_obj.getString("src");
  }
  
  void printDetails() {
    println("name: " + name);
  }
}
