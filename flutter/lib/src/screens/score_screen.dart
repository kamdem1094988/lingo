import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lingo/src/screens/my_app.dart';

import '../controller/travel_question_controller.dart';
import '../shared/constants/constants.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TravelQuestionController qnController = Get.put(TravelQuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/svg/bg.svg",
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                "Congratulations🥳",
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              // Text(
              //   "${qnController.correctAns * 10}/${qnController.questions.length * 10}",
              //   style: Theme.of(context)
              //       .textTheme
              //       .headline1
              //       ?.copyWith(color: kSecondaryColor),
              // ),
              const SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () {
                  qnController.onClose();
                  Navigator.of(context).pushReplacementNamed(MyAppPages.routeName);
                  },
                child: Text(
                  "Finish",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(color: Colors.white),
                ),
              ),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
