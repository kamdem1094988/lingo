import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lingo/src/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

import '../../services/firestore_methods.dart';
import '../../shared/constants/user_data.dart';
import '../../shared/widget/appbar.dart';

// This class handles the Page to edit the Name Section of the User Profile.
class EditNameFormPage extends StatefulWidget {
  const EditNameFormPage({Key? key}) : super(key: key);

  @override
  EditNameFormPageState createState() {
    return EditNameFormPageState();
  }
}

class EditNameFormPageState extends State<EditNameFormPage> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();


  @override
  void dispose() {
    firstNameController.dispose();
    secondNameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final uid = context.read<FirebaseAuthMethods>().user.uid;
    print('-------------> $uid');
    super.initState();
  }

  void updateUserValue(String name) async{
    final uid = context.read<FirebaseAuthMethods>().user.uid;
    print('-------------> $uid');
    context.read<FirestoreMethods>().updateUserInfo(name: name, uid: uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                      width: 330,
                      child: Text(
                        "What's Your Name?",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 40, 16, 0),
                          child: SizedBox(
                              height: 100,
                              width: 150,
                              child: TextFormField(
                                // Handles Form Validation for First Name
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your first name';
                                  } else if (!isAlpha(value)) {
                                    return 'Only Letters Please';
                                  }
                                  return null;
                                },
                                decoration:
                                const InputDecoration(labelText: 'First Name'),
                                controller: firstNameController,
                              ))),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 40, 16, 0),
                          child: SizedBox(
                              height: 100,
                              width: 150,
                              child: TextFormField(
                                // Handles Form Validation for Last Name
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your last name';
                                  } else if (!isAlpha(value)) {
                                    return 'Only Letters Please';
                                  }
                                  return null;
                                },
                                decoration:
                                const InputDecoration(labelText: 'Last Name'),
                                controller: secondNameController,
                              )))
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 330,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate() &&
                                    isAlpha(firstNameController.text +
                                        secondNameController.text)) {
                                  print('-----------------_____> ${firstNameController.text} ${secondNameController.text}');
                                  updateUserValue("${firstNameController.text} ${secondNameController.text}");
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text(
                                'Update',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          )))
                ],
              ),
            ),
          ),
        ));
  }
}