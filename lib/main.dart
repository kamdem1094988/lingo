import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lingo/firebase_options.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'src/screens/choose_lang.dart';
import 'src/screens/choose_level.dart';
import 'src/screens/choose_spec.dart';
import 'src/screens/onboarding.dart';
import 'src/screens/splash.dart';
import 'src/screens/login.dart';
import 'src/screens/sign_up.dart';
import '/src/screens/home.dart';
import 'src/shared/constants/stylings.dart';
import 'src/screens/board.dart';
import 'src/screens/profile.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lingo',
      debugShowCheckedModeBanner: false,
      // locale: Get.deviceLocale,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      home: const MyAppPages(),
      routes: {
        SignUpScreen.routeName: (ctx) => const SignUpScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        SplashScreen.routeName: (ctx) => const SplashScreen(),
        OnboardingScreen.routeName: (ctx) => const OnboardingScreen(),
        ChooseLevelScreen.routeName: (ctx) => const ChooseLevelScreen(),
        ChooseLanguageScreen.routeName: (ctx) => const ChooseLanguageScreen(),
        ChooseSpecialisationScreen.routeName: (ctx) => const ChooseSpecialisationScreen(),
        HomeScreen.routeName: (ctx) => const HomeScreen(),
      },
    );
  }
}


class MyAppPages extends StatefulWidget {
  const MyAppPages({Key? key}) : super(key: key);

  @override
  State<MyAppPages> createState() => _MyAppPagesState();
}

class _MyAppPagesState extends State<MyAppPages> {
  var _currentIndex = 0;
  
  
  static  List<Widget> _pages = <Widget>[
    HomeScreen(),
    BoardScreen(),
    ProfileScreen()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => _onItemTapped(i),
        items: [

          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.blue,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(Icons.bar_chart_outlined),
            title: const Text("Board"),
            selectedColor: Colors.blue,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.account_box),
            title: const Text("Profile"),
            selectedColor: Colors.blue,
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_currentIndex),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            AppBar(title: const Text('Lingo'),),
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
            ListTile(
              leading: const Icon(Icons.backup),
              title: const Text('Backup'),
              onTap: () => Navigator.of(context).pushNamed(ChooseLanguageScreen.routeName),
            ),
            ListTile(
              leading: const Icon(Icons.remove_red_eye),
              title: const Text('Revisions'),
              onTap: () => Navigator.of(context).pushNamed(ChooseLanguageScreen.routeName),
            ),
            const Spacer(),
            ListTile(
              title: const Text('Lingo App By Company'),
              trailing: IconButton(onPressed: (){
                setState((){
                  Navigator.of(context).popAndPushNamed(SplashScreen.routeName);
                });
              }, icon: const Icon(Icons.logout)),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  
}


