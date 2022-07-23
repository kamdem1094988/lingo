import 'package:flutter/material.dart';

enum RememberQ { yes, no }

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign-up';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    RememberQ? _question = RememberQ.no;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
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
                  hintText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
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
                onPressed: () {},
                child: const Text('Sign Up'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Text('Already have an account log In'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Login',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
