import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

import '../../services/firebase_auth_methods.dart';
import '../../services/firestore_methods.dart';
import '../../shared/constants/user_data.dart';
import '../../shared/widget/appbar.dart';

// This class handles the Page to edit the Email Section of the User Profile.
class EditEmailFormPage extends StatefulWidget {
  const EditEmailFormPage({Key? key}) : super(key: key);

  @override
  EditEmailFormPageState createState() {
    return EditEmailFormPageState();
  }
}

class EditEmailFormPageState extends State<EditEmailFormPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void updateUserEmail(String email) {
    user.email = email;
    final uid = context.read<FirebaseAuthMethods>().user.uid;
    context.read<FirestoreMethods>().updateEmail(email: email, uid: uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                      width: 320,
                      child:  Text(
                        "What's your email?",
                        style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: SizedBox(
                          height: 100,
                          width: 320,
                          child: TextFormField(
                            // Handles Form Validation
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email.';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: 'Your email address'),
                            controller: emailController,
                          ))),
                  Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 320,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate() &&
                                    EmailValidator.validate(
                                        emailController.text)) {
                                  updateUserEmail(emailController.text);
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text(
                                'Update',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          )))
                ]),
          ),
        ));
  }
}