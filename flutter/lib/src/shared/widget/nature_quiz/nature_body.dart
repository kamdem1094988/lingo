import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';


import '../../../controller/nature_question_controller.dart';
import '../../constants/constants.dart';
import 'nature_progress_bar.dart';
import 'nature_question_card.dart';

class NatureBody extends StatelessWidget {
  const NatureBody({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    NatureQuestionController questionController = Get.put(NatureQuestionController());
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
                child: NatureProgressBar(),
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
                  itemBuilder: (context, index) => NatureQuestionCard(
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