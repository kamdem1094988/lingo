import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../shared/utils/show_snackbar.dart';


class FirebaseAuthMethods{
  late final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

  //EMAIL SIGN UP
  Future<void> signUpWithEmail({
  required String email,
    required String password,
    required BuildContext context
  }) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e) {
      showSnackBar(context, e.message!);
    }
  }



}