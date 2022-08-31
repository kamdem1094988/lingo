import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingo/src/models/users.dart';

import '../shared/constants/question_data.dart';

class FirestoreMethods {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  final usersRef =
      FirebaseFirestore.instance.collection('users').withConverter<Users>(
            fromFirestore: (snapshot, _) => Users.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          );

  static const String travelSpecId = "enzFVMS40uzJLgnLEKQh";
  static const String natureSpecId = "6UfhORTDXXRLcmoTi0tW";
  static const String sportSpecId = "MqycN8VrkRJLbQiEdCXe";
  static const String computerSpecId = "wNYeb8CKiFYMT4Rce1L7";

  // Add new user to firestore db
  static Future addNewUser(
      {required String uid,
      String? email,
      String? level,
      String? imageUrl,
      String? username,
      String? phone}) async {
    // Create a reference to the document the transaction will use

    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (!snapshot.exists) {
      // user not existing, create user
      return users
          .doc(uid.toString())
          .set({
            'email': email!,
            'level': level ?? '',
            'profile_image': imageUrl!,
            'username': username!,
            'phone': level ?? '',
          })
          .then((value) => print("User Added"))
          .catchError((error) {
            print("Failed to add user: $error");
          });
    }
  }

  // Get user DB Infos from firestore
  Future<Map> getUserInfoFromDB({required String uid}) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    return Map.from(snapshot.data() as Map);
  }

  // Get travel specializations
  static Future<void> getTravelSpecialization() async {
    int index = 0;
    FirebaseFirestore.instance // get and loop all Quizzes
        .collection('specialisation')
        .doc(travelSpecId)
        .collection('quiz')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map i = doc.data() as Map;

        FirebaseFirestore.instance // get loop into quizzes answers
            .collection('specialisation')
            .doc(travelSpecId)
            .collection('quiz')
            .doc(doc.id)
            .collection("answers")
            .doc("answers")
            .get()
            .then((value) {
          Map j = value.data() as Map;
          List<String> options = [];
          int goodAnswerIndex = 0;

          j.forEach((k, v) {
            options.add(v.toString());
            if (v == i['good_answer']) {
              goodAnswerIndex = int.parse(k);
              goodAnswerIndex -=
                  1; // indexing start on firebase record with 1 so here it should  stard with o
            }
          });

          // update models data
          travelData.add({
            "id": index,
            "question": i['text'],
            "media": i['image'] ?? i['video'],
            "type": i['type'],
            "options": options,
            "answer_index": goodAnswerIndex
          });
          index += 1;
        });
      });
    });
  }

  // Get Nature specializations
  static Future<void> getNatureSpecialization() async {
    int index = 0;
    FirebaseFirestore.instance // get and loop all Quizzes
        .collection('specialisation')
        .doc(natureSpecId)
        .collection('quiz')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map i = doc.data() as Map;

        FirebaseFirestore.instance // get loop into quizzes answers
            .collection('specialisation')
            .doc(natureSpecId)
            .collection('quiz')
            .doc(doc.id)
            .collection("answers")
            .doc("answers")
            .get()
            .then((value) {
          Map j = value.data() as Map;
          List<String> options = [];
          int goodAnswerIndex = 0;

          j.forEach((k, v) {
            options.add(v.toString());
            if (v == i['good_answer']) {
              goodAnswerIndex = int.parse(k);
              goodAnswerIndex -=
                  1; // indexing start on firebase record with 1 so here it should  stard with o
            }
          });

          // update models data
          natureData.add({
            "id": index,
            "question": i['text'],
            "media": i['image'] ?? i['video'],
            "type": i['type'],
            "options": options,
            "answer_index": goodAnswerIndex
          });
          index += 1;
        });
      });
    });
  }

  // Get Sport specializations
  static Future<void> getSportSpecialization() async {
    int index = 0;
    FirebaseFirestore.instance // get and loop all Quizzes
        .collection('specialisation')
        .doc(sportSpecId)
        .collection('quiz')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map i = doc.data() as Map;

        FirebaseFirestore.instance // get loop into quizzes answers
            .collection('specialisation')
            .doc(sportSpecId)
            .collection('quiz')
            .doc(doc.id)
            .collection("answers")
            .doc("answers")
            .get()
            .then((value) {
          Map j = value.data() as Map;
          List<String> options = [];
          int goodAnswerIndex = 0;

          j.forEach((k, v) {
            options.add(v.toString());
            if (v == i['good_answer']) {
              goodAnswerIndex = int.parse(k);
              goodAnswerIndex -=
                  1; // indexing start on firebase record with 1 so here it should  stard with o
            }
          });

          // update models data
          sportData.add({
            "id": index,
            "question": i['text'],
            "media": i['image'] ?? i['video'],
            "type": i['type'],
            "options": options,
            "answer_index": goodAnswerIndex
          });
          index += 1;
        });
      });
    });
  }

  // Get Computer specializations
  static Future<void> getComputerSpecialization() async {
    int index = 0;
    FirebaseFirestore.instance // get and loop all Quizzes
        .collection('specialisation')
        .doc(computerSpecId)
        .collection('quiz')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map i = doc.data() as Map;

        FirebaseFirestore.instance // get loop into quizzes answers
            .collection('specialisation')
            .doc(computerSpecId)
            .collection('quiz')
            .doc(doc.id)
            .collection("answers")
            .doc("answers")
            .get()
            .then((value) {
          Map j = value.data() as Map;
          List<String> options = [];
          int goodAnswerIndex = 0;

          j.forEach((k, v) {
            options.add(v.toString());
            if (v == i['good_answer']) {
              goodAnswerIndex = int.parse(k);
              goodAnswerIndex -=
                  1; // indexing start on firebase record with 1 so here it should  stard with o
            }
          });

          // update models data
          computerData.add({
            "id": index,
            "question": i['text'],
            "media": i['image'] ?? i['video'],
            "type": i['type'],
            "options": options,
            "answer_index": goodAnswerIndex
          });
          index += 1;
        });
      });
    });
  }

  // Get specializations
  static Future<void> getSpecialization() async {
    await getTravelSpecialization();
    await getNatureSpecialization();
    await getSportSpecialization();
    await getComputerSpecialization();
  }

  // update user name information in firestore
  Future<void> updateUserName({required String uid, String? name}) async {
    await users
        .doc(uid)
        .update({'username': name!})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  // update user phone information in firestore
  Future<void> updatePhone({required String uid, String? phone}) async {
    await users
        .doc(uid)
        .update({'phone': phone!})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  // update user description information in firestore
  Future<void> updateDescription({required String uid, String? about}) async {
    await users
        .doc(uid)
        .update({'description': about!})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  // update user email information in firestore
  Future<void> updateEmail({required String uid, String? email}) async {
    await users
        .doc(uid)
        .update({'email': email!})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
