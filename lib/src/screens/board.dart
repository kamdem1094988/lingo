import 'package:flutter/material.dart';

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
                          'assets/images/Robot.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Flexible(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Technologie',
                            style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          )),
                    ),
                    const Flexible(child: TopicProgress()),
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
                          'assets/images/Robot.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Flexible(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Technologie',
                            style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          )),
                    ),
                    const Flexible(child: TopicProgress()),
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
                          'assets/images/Robot.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Flexible(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Technologie',
                            style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          )),
                    ),
                    const Flexible(child: TopicProgress()),
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
                          'assets/images/Robot.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Flexible(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Technologie',
                            style: TextStyle(
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          )),
                    ),
                    const Flexible(child: TopicProgress()),
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
