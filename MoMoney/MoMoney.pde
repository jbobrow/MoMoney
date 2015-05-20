// The following short JSON file called "data.json" is parsed 
// in the code below. It must be in the project's "data" folder.
//
// {
//   "id": 0,
//   "species": "Panthera leo",
//   "name": "Lion"
// }

JSONObject json;

void setup() {

  json = loadJSONObject("misogyny_stats.json");

  JSONArray root = json.getJSONArray("MisogynyStats");
  for(int i=0; i<root.size(); i++) {
    JSONObject obj = root.getJSONObject(i);
    JSONObject name = obj.getJSONObject("name");
    println(name.getString("text"));
  }
}

// Sketch prints:
// 0, Panthera leo, Lion
