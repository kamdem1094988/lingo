import 'package:flutter/material.dart';
import 'package:lingo/src/screens/choose_level.dart';

class ChooseLanguageScreen extends StatefulWidget {
  static const routeName = '/choose-language';

  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Choose The Language you want to Learn'),
              const SizedBox(height: 30,),
              Container(
                padding: const EdgeInsets.all(10),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  elevation: 16,
                  onChanged: (String? newValue) {
                    debugPrint(newValue);
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['English', 'French', 'Italian', 'Espagnol'].map<DropdownMenuItem<String>>((String value) {
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
                  onPressed: () => Navigator.of(context).pushNamed(ChooseLevelScreen.routeName),
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
