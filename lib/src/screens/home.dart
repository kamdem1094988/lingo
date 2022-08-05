import 'package:flutter/material.dart';
import 'package:lingo/src/screens/board.dart';
import 'package:lingo/src/screens/choose_lang.dart';
import 'package:lingo/src/screens/choose_level.dart';
import 'package:lingo/src/screens/choose_spec.dart';
import 'package:lingo/src/screens/login.dart';
import 'package:lingo/src/screens/onboarding.dart';
import 'package:lingo/src/screens/profile.dart';
import 'package:lingo/src/screens/sign_up.dart';
import 'package:lingo/src/screens/splash.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:get/get.dart';

import '../shared/constants/images.dart';
import '../shared/constants/stylings.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PreferredSize(
                preferredSize: const Size.fromHeight(120.0),
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).viewPadding.top, left: 30, right: 30),
                  height: 120,
                  decoration: const BoxDecoration(
                    color: AppTheme.white,
                  ),
                  child:
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome!',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: Colors.black.withOpacity(.7)),
                          ),
                          Text(
                            'Good Morning',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ]),
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        backgroundImage: AssetImage(PlaceholderImages.avatar),
                      ),
                    ),
                  ]),
                ),
              ),
              Container(
                  width: Get.size.width,
                  height: Get.size.height / 4,
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: AppTheme.blue,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: Get.size.width,
                        height: Get.size.height / 4,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Color(0xff009ffd), Color(0xff36096d)],
                          ),
                          color: AppTheme.dark,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'This quiz contains 10 multiple choice questions.',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: AppTheme.white, fontSize: 12),
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: const StadiumBorder(),
                                primary: Colors.white,
                                backgroundColor: const Color(0xff009ffd),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 25),
                                side: const BorderSide(color: AppTheme.white, width: 1),
                              ),
                              onPressed: () {
                                // Get.to(()=> QuestionsView(), binding: QuestionsBinding());
                                // QuizAlerts().confirm(
                                //     'This quiz contains 10 question\n',
                                //     'Proceed',
                                //     'Cancel',
                                //     () => controller.goToQuiz(),
                                //     () => Get.back(),
                                //     context);
                              },
                              child: const Text('Begin quiz'),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Cashir Quiz',
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(
                                          color: AppTheme.white, fontSize: 35),
                                ),
                                Text(
                                  '10 Questions',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(color: AppTheme.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Text('Subjects',
                    style: Theme.of(context).textTheme.headline1),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          // QuizAlerts().confirm(
                          //     'This quiz contains 10 question\n',
                          //     'Proceed',
                          //     'Cancel',
                          //     () => controller.goToQuiz(),
                          //     () => Get.back(),
                          //     context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          // width: (Get.size.width / 2) - 30,
                          height: 120,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color(0xffff0f7b),
                                Color(0xfff89b29),
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '10',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            color: AppTheme.white, fontSize: 30),
                                  ),
                                  const Icon(
                                    Icons.directions_bus,
                                    color: AppTheme.white,
                                    size: 40,
                                  )
                                ],
                              ),
                              Text(
                                'Vehicles',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                      color: AppTheme.white,
                                    ),
                              ),
                              Text(
                                'Answer ten questions on boats',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        color: AppTheme.white, fontSize: 10),
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // QuizAlerts().error('Opps...', 'Questions on boats subject are unavailable', context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          // width: (Get.size.width / 2) - 30,
                          height: 120,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Color(0xff40c9ff), Color(0xffe81cff)],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '10',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            color: AppTheme.white, fontSize: 30),
                                  ),
                                  const Icon(
                                    Icons.directions_boat_filled_outlined,
                                    color: AppTheme.white,
                                    size: 40,
                                  )
                                ],
                              ),
                              Text(
                                'Boats',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                      color: AppTheme.white,
                                    ),
                              ),
                              Text(
                                'Answer ten questions on boats',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        color: AppTheme.white, fontSize: 10),
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          // QuizAlerts().error('Opps...', 'Questions on bikes subject are unavailable', context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          width: (Get.size.width / 2) - 30,
                          height: 120,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Color(0xff9bafd9), Color(0xff103783)],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '10',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            color: AppTheme.white, fontSize: 30),
                                  ),
                                  const Icon(
                                    Icons.directions_bike,
                                    color: AppTheme.white,
                                    size: 40,
                                  )
                                ],
                              ),
                              Text(
                                'Bikes',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                      color: AppTheme.white,
                                    ),
                              ),
                              Text(
                                'Answer ten questions on boats',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        color: AppTheme.white, fontSize: 10),
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // QuizAlerts().error('Opps...', 'Questions on trains subject are unavailable', context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          // width: (Get.size.width / 2) - 30,
                          height: 120,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Color(0xffef745c), Color(0xff34073d)],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '10',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1!
                                        .copyWith(
                                            color: AppTheme.white, fontSize: 30),
                                  ),
                                  const Icon(
                                    Icons.directions_subway,
                                    color: AppTheme.white,
                                    size: 40,
                                  )
                                ],
                              ),
                              Text(
                                'Trains',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                      color: AppTheme.white,
                                    ),
                              ),
                              Text(
                                'Answer ten questions on boats',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                        color: AppTheme.white, fontSize: 10),
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}