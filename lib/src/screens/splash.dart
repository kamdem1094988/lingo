import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/splsh-screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('Lingo', style: TextStyle(color: Colors.blue, fontSize: 40, fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text('The best way to learn Language',),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: null, child:Icon(Icons.navigate_next_outlined))
            ],
          ),
        ),
      ),
    );
  }
}
