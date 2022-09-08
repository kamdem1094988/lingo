
List travelData = [];
List natureData = [];
List sportData = [];
List computerData = [];

const List sample_data = [
  {
    "id": 1,
    "question":
    "Flutter is an open-source UI software development kit created by ______",
    "media": "",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "media": "",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "media": "",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "media": "",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
];

class QuestionData{

  static String whatSpecialization = ''; // used in controller to know which quizz sery to launch


}

//TODO: improve moock data intrance with sharedPreferences
// Future init() async =>
// _preferences = await SharedPreferences.getInstance();
//
//  Future setUser(Users user) async {
// final json = jsonEncode(user.toJson());
//
// await _preferences.setString(_keyUser, json);
// }
//
//  Users getUser() {
// final json = _preferences.getString(_keyUser);
//
// return json == null ? myUser : Users.fromJson(jsonDecode(json));
// }