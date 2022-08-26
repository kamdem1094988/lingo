import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lingo/src/models/users.dart';

class FirestoreMethods {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  final usersRef =
      FirebaseFirestore.instance.collection('users').withConverter<Users>(
            fromFirestore: (snapshot, _) => Users.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          );

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

  // update user information in firestore
  Future<void> updateUserInfo(
      {required String uid, String? name, String? phone, String? about}) async {
    users
        .doc(uid)
        .update({'name': name!, 'phone': phone!, 'aboutMeDescription': about!})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }
}
