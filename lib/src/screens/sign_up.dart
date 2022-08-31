import 'package:flutter/material.dart';
import 'package:lingo/src/screens/login.dart';
import 'package:provider/provider.dart';

import '../services/firebase_auth_methods.dart';

enum RememberQ { yes, no }

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup-email-password';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  RememberQ? _question = RememberQ.no;

  void signUpUser() async {
    context.read<FirebaseAuthMethods>().signUpWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Sign UP',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.blueAccent),
            ),
            const Text('Please sign up to enter in app.'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      padding: const EdgeInsets.all(5),
                    ),
                    onPressed: null,
                    child: Image.asset(
                      'assets/images/fb_btn.png',
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: const EdgeInsets.all(5),
                      ),
                      onPressed: null,
                      child: Image.asset(
                        'assets/images/google_btn.png',
                        height: 50,
                        fit: BoxFit.cover,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Or sign up with email',
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              controller: usernameController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: 'Enter your Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              controller: emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              controller: passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Radio<RememberQ>(
                    value: RememberQ.yes,
                    groupValue: _question,
                    onChanged: (RememberQ? value) {
                      setState(() => _question = value);
                    }),
                const Text('I agree with private Policy')
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: const EdgeInsets.all(5),
                ),
                onPressed: signUpUser,
                child: const Text('Sign Up'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text('Already have an account log In'),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () => Navigator.of(context)
                      .popAndPushNamed(LoginScreen.routeName),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
