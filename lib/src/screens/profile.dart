import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lingo/src/screens/profile/edit_description.dart';
import 'package:lingo/src/screens/profile/edit_email.dart';
import 'package:lingo/src/screens/profile/edit_name.dart';
import 'package:lingo/src/screens/profile/edit_phone.dart';
import 'package:lingo/src/services/firestore_methods.dart';
import 'package:provider/provider.dart';

import '../services/firebase_auth_methods.dart';
import '../shared/constants/stylings.dart';
import '../shared/widget/display_profile_image.dart';
import '../models/users.dart';

// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  Map myData = {
    "profile_image": "",
    "phone": "",
    "level": "",
    "email": "",
    "username": ""
  };
  final user = FirebaseAuth.instance.currentUser;

  _getData() async {
    myData = await context
        .read<FirestoreMethods>()
        .getUserInfoFromDB(uid: user!.uid);
    setState(() {});
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  void signOut() async {
    context.read<FirebaseAuthMethods>().signOut(context);
  }


  @override
  Widget build(BuildContext context) {
    // final user = UserData.myUser;
    final user = FirebaseAuth.instance.currentUser;
    var myUser;

    if (user != null) {
      // Name, email address, and profile photo URL
      final name = user.displayName;
      final email = user.email;
      final photoUrl = user.photoURL;

      // Check if user's email is verified
      final emailVerified = user.emailVerified;

      // The user's ID, unique to the Firebase project. Do NOT use this value to
      // authenticate with your backend server, if you have one. Use
      // User.getIdToken() instead.
      final uid = user.uid;

      myUser = Users(
        email: email.toString(),
        level: '',
        profile_image: photoUrl.toString(),
        username: name.toString(),
        phone: user.phoneNumber.toString(),
        aboutMeDescription: '',
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top,
              left: 30,
              right: 30),
          height: 120,
          decoration: const BoxDecoration(
            color: AppTheme.white,
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(
                            color: Colors.black.withOpacity(.7)),
                      ),
                      Text(
                        '',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ]),
                InkWell(
                  onTap: () => signOut(),
                  child: Row(children: const [
                    Text('Logout'),
                    SizedBox(width: 8.0,),
                    Icon(Icons.logout),
                  ],)
                ),
              ]),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 10,
            ),
            const Center(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(64, 105, 225, 1),
                      ),
                    ))),
            InkWell(
                onTap: () {
                  // navigateSecondPage(const EditImagePage());
                },
                child: DisplayImage(
                  // imagePath: user!.photoURL as String,
                  imagePath: myData['profile_image'] != '' ? myData['profile_image'] : 'assets/images/no-image.png',
                  onPressed: () {

                  },
                )),
            buildUserInfoDisplay(
                myData['username'], 'Name', const EditNameFormPage()),
            buildUserInfoDisplay(
                myData['phone'], 'Phone', const EditPhoneFormPage()),
            buildUserInfoDisplay(
                myData['email'], 'Email', const EditEmailFormPage()),
            // buildUserInfoDisplay(
            //     user!.email.toString(), 'Email', const EditEmailFormPage()),
            buildAbout(myUser),
          ],
        ),
      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              navigateSecondPage(editPage);
                            },
                            child: Text(
                              getValue,
                              style: const TextStyle(fontSize: 16, height: 1.4),
                            ))),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      size: 40.0,
                    )
                  ]))
            ],
          ));

  // Widget builds the About Me Section
  Widget buildAbout(Users user) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 1),
          Container(
              width: 350,
              height: 200,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 1,
              ))),
              child: Row(children: [
                Expanded(
                    child: TextButton(
                        onPressed: () {
                          navigateSecondPage(const EditDescriptionFormPage());
                        },
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: myData['description'] == null ? const CircularProgressIndicator(): Text(
                                  myData['description'] ,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    height: 1.4,
                                  ),
                                )
                            )))),
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 40.0,
                )
              ]))
        ],
      ));

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
