import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:lingo/firebase_options.dart';
import 'package:lingo/src/services/firestore_methods.dart';
import 'package:lingo/src/shared/utils/my_shared_prefference.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/screens/choose_lang.dart';
import 'src/screens/choose_level.dart';
import 'src/screens/choose_spec.dart';
import 'src/screens/my_app.dart';
import 'src/screens/onboarding.dart';
import 'src/screens/splash.dart';
import 'src/screens/login.dart';
import 'src/screens/sign_up.dart';
import '/src/screens/home.dart';
import 'src/services/firebase_auth_methods.dart';
import 'src/shared/constants/stylings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kIsWeb) {
    FacebookAuth.i.webInitialize(
      appId: "1129634001214960", // Replace with your app id
      cookie: true,
      xfbml: true,
      version: "v12.0",
    );
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthMethods>(
          create: (_) => FirebaseAuthMethods(FirebaseAuth.instance),
        ),
        Provider<FirestoreMethods>(
          create: (_) => FirestoreMethods(),
        ),
        StreamProvider(
          create: (context) => context.read<FirebaseAuthMethods>().authState,
          initialData: null,
        ),
      ],
      child: GetMaterialApp(
        title: 'Lingo',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.dark(),
        // locale: Get.deviceLocale,
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        home: const AuthWrapper(),
        routes: {
          SignUpScreen.routeName: (ctx) => const SignUpScreen(),
          LoginScreen.routeName: (ctx) => const LoginScreen(),
          SplashScreen.routeName: (ctx) => const SplashScreen(),
          OnboardingScreen.routeName: (ctx) => const OnboardingScreen(),
          ChooseLevelScreen.routeName: (ctx) => const ChooseLevelScreen(),
          ChooseLanguageScreen.routeName: (ctx) => const ChooseLanguageScreen(),
          ChooseSpecialisationScreen.routeName: (ctx) =>
              const ChooseSpecialisationScreen(),
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          MyAppPages.routeName: (ctx) => const MyAppPages(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {

  bool isSplash = true;
  bool? isFirstTime;


  @override
  void initState() {
    FirestoreMethods.getSpecialization();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isSplash = false;
      });

    });
    super.initState();
  }

  startTime() async{
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    isFirstTime = prefs.getBool('first_time');

    if(isFirstTime == null ){
      MySharedPreferences.instance.setBooleanValue("first_time", true); // it's the first time to open the app
      isFirstTime = true; // it's not the first time to open the app
    }
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    startTime();

    if (isSplash) {
      return const SplashScreen();
    }

    if (isFirstTime!) {
      return const OnboardingScreen();
    }

    if (firebaseUser != null) {
      if (isFirstTime!) {
        return const ChooseLanguageScreen();
      }
    }

    if (firebaseUser != null) {
      return const MyAppPages();
    }
    return const LoginScreen();
  }
}