

import 'package:flutter/material.dart';
import 'package:lingo/src/screens/profile.dart';
import 'package:lingo/src/shared/widget/drawer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'board.dart';
import 'home.dart';

class MyAppPages extends StatefulWidget {
  static const routeName = '/my-app';
  const MyAppPages({Key? key}) : super(key: key);

  @override
  State<MyAppPages> createState() => _MyAppPagesState();
}

class _MyAppPagesState extends State<MyAppPages> {
  var _currentIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const BoardScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Lingo'),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.notifications),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
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
      drawer: const CustomDrawer(),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}