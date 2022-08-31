import 'package:flutter/material.dart';

import '../shared/constants/stylings.dart';
import '../shared/widget/progress_bar.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(8.0),
        child: Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top, left: 30, right: 30),
          height: 120,
          decoration: const BoxDecoration(
            color: AppTheme.white,
          ),
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        children: [
          Hero(
            tag: 'assets/images/Robot.jpg',
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) => TopicScreen(topic: topic),
                  //   ),
                  // );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 3,
                      child: SizedBox(
                        child: Image.asset(
                          'assets/images/travel21.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Flexible(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Travel',
                            style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          )),
                    ),
                    Flexible(child: TopicProgress(spec: 'travel')),
                  ],
                ),
              ),
            ),
          ),
          Hero(
            tag: 'assets/images/Robot.jpg',
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) => TopicScreen(topic: topic),
                  //   ),
                  // );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 3,
                      child: SizedBox(
                        child: Image.asset(
                          'assets/images/Nature21.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Flexible(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Nature',
                            style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          )),
                    ),
                    Flexible(child: TopicProgress(spec: 'nature')),
                  ],
                ),
              ),
            ),
          ),
          Hero(
            tag: 'assets/images/Robot.jpg',
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) => TopicScreen(topic: topic),
                  //   ),
                  // );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 3,
                      child: SizedBox(
                        child: Image.asset(
                          'assets/images/sport_spec.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Flexible(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Sport',
                            style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          )),
                    ),
                    Flexible(child: TopicProgress(spec: 'sport')),
                  ],
                ),
              ),
            ),
          ),
          Hero(
            tag: 'assets/images/Robot.jpg',
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) => TopicScreen(topic: topic),
                  //   ),
                  // );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 3,
                      child: SizedBox(
                        child: Image.asset(
                          'assets/images/computer20.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Flexible(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Computer',
                            style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          )),
                    ),
                    Flexible(child: TopicProgress(spec: 'computer')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
