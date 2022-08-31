import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';


import '../../../controller/travel_question_controller.dart';
import '../../constants/constants.dart';
import 'travel_progress_bar.dart';
import 'travel_question_card.dart';

class TravelBody extends StatelessWidget {
  const TravelBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    TravelQuestionController questionController = Get.put(TravelQuestionController());
    return Stack(
      fit: StackFit.expand,
      children: [
        SvgPicture.asset("assets/svg/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: TravelProgressBar(),
              ),
              const SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Question ${questionController.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                          text: "/${questionController.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(color: kSecondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 1.5),
              const SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: const NeverScrollableScrollPhysics(),
                  // physics: const AlwaysScrollableScrollPhysics(),
                  controller: questionController.pageController,
                  onPageChanged: questionController.updateTheQnNum,
                  itemCount: questionController.questions.length,
                  itemBuilder: (context, index) => TravelQuestionCard(
                      question: questionController.questions[index]),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
