import 'package:flutter/material.dart';

import '../screens/choose_lang_screen.dart';
import '../screens/choose_level_screen.dart';
import '../screens/choose_spec_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';
import '../screens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lingo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lingo'),
      routes: {
        SignUpScreen.routeName: (ctx) => const SignUpScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        SplashScreen.routeName: (ctx) => const SplashScreen(),
        OnboardingScreen.routeName: (ctx) => const OnboardingScreen(),
        ChooseLevelScreen.routeName: (ctx) => const ChooseLevelScreen(),
        ChooseLanguageScreen.routeName: (ctx) => const ChooseLanguageScreen(),
        ChooseSpecialisationScreen.routeName: (ctx) => const ChooseSpecialisationScreen(),
      },
    );
  }
}




class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            AppBar(title: Text('Lingo'),),
            ListTile(
              leading: const Icon(Icons.assignment_ind),
              title: const Text('SIgn UP'),
              onTap: () => Navigator.of(context).pushNamed(SignUpScreen.routeName),
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () => Navigator.of(context).pushNamed(LoginScreen.routeName),
            ),
            ListTile(
              leading: const Icon(Icons.wheelchair_pickup),
              title: const Text('Splash Screen'),
              onTap: () => Navigator.of(context).pushNamed(SplashScreen.routeName),
            ),
            ListTile(
              leading: const Icon(Icons.ac_unit),
              title: const Text('Onboard Screen'),
              onTap: () => Navigator.of(context).pushNamed(OnboardingScreen.routeName),
            ),
            ListTile(
              leading: const Icon(Icons.eleven_mp),
              title: const Text('Choose Level Screen'),
              onTap: () => Navigator.of(context).pushNamed(ChooseLevelScreen.routeName),
            ),
            ListTile(
              leading: const Icon(Icons.access_time_outlined),
              title: const Text('Choose Spec screen'),
              onTap: () => Navigator.of(context).pushNamed(ChooseSpecialisationScreen.routeName),
            ),
            ListTile(
              leading: const Icon(Icons.abc),
              title: const Text('Choose Lang screen'),
              onTap: () => Navigator.of(context).pushNamed(ChooseLanguageScreen.routeName),
            ),
          ],
        ),
      ),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'This is Lingo App',
            ),
          ],
        ),
      ),
    );
  }
}
