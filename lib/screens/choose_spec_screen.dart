import 'package:flutter/material.dart';

class ChooseSpecialisationScreen extends StatefulWidget {
  static const routeName = '/choose-specialisation';

  const ChooseSpecialisationScreen({Key? key}) : super(key: key);

  @override
  State<ChooseSpecialisationScreen> createState() => _ChooseSpecialisationScreenState();
}

class _ChooseSpecialisationScreenState extends State<ChooseSpecialisationScreen> {
  String dropDownValue = 'Computer Science';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Choose your current Domain'),
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
                  items: <String>['Computer Science', 'Nature', 'Travel', 'Sport'].map<DropdownMenuItem<String>>((String value) {
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
