import 'package:flutter/material.dart';

class ChooseLevelScreen extends StatefulWidget {
  static const routeName = '/choose-level';

  const ChooseLevelScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLevelScreen> createState() => _ChooseLevelScreenState();
}

class _ChooseLevelScreenState extends State<ChooseLevelScreen> {
  String dropDownValue = 'Level 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Choose The Level your think for the language'),
              const SizedBox(height: 30,),
              Container(
                padding: const EdgeInsets.all(10),
                child: DropdownButton<String>(
                  value: dropDownValue,
                  elevation: 16,
                  onChanged: (String? newValue) {
                    print(newValue);
                    setState(() {
                      dropDownValue = newValue!;
                    });
                  },
                  items: <String>['Level 1', 'Level 2', 'Level 3', 'Level 4'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 40,),
              Container(
                padding: const EdgeInsets.all(40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: const EdgeInsets.all(5),
                  ),
                  onPressed: () {},
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
