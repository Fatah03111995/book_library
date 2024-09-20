import 'package:book_library/const/const.dart';
import 'package:book_library/util/util.dart';
import 'package:book_library/widget/menu_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Util util = Util(context: context);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: util.width,
              height: util.isPhone ? 120 : 80,
              color: Colors.blue,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: util.isPhone
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Book Library',
                        style: defaultTxt.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      if (!util.isPhone)
                        SizedBox(
                          width: 150,
                          child: MenuNavBar(
                              activeIndex: index,
                              changeIndex: (ind) {
                                setState(() {
                                  index = ind;
                                });
                              }),
                        )
                    ],
                  ),
                  if (util.isPhone) const SizedBox(height: 10),
                  if (util.isPhone)
                    SizedBox(
                      width: util.width,
                      child: MenuNavBar(
                          activeIndex: index,
                          changeIndex: (ind) {
                            setState(() {
                              index = ind;
                            });
                          }),
                    )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
