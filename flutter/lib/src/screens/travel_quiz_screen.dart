import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lingo/src/shared/widget/travel_quiz/travel_body.dart';

import '../controller/travel_question_controller.dart';

class TravelQuizScreen extends StatelessWidget {
  const TravelQuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TravelQuestionController controller = Get.put(TravelQuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Flutter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: controller.nextQuestion, child: const Text("Skip")),
        ],
      ),
      body: const TravelBody(),
    );
  }
}
