import 'package:book_library/const/const.dart';
import 'package:book_library/data_provider/dummy.dart';
import 'package:book_library/models/book_model.dart';
import 'package:book_library/util/util.dart';
import 'package:book_library/widget/book_card.dart';
import 'package:book_library/widget/menu_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BookModel> books = Dummy.books;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    Util util = Util(context: context);
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            //-------------NAVBAR
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
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
            const SizedBox(height: 20),

            //-------------------MAIN SECTION

            //-------------------IF PHONE DEVICE
            if (util.isPhone)
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            childAspectRatio: 0.5),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return BookCard(book: books[index]);
                    }),
              ),

            //-------------------IF TABLET DEVICE
            if (util.isTablet)
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            childAspectRatio: 0.5),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return BookCard(book: books[index]);
                    }),
              ),

            // ----------------IF PC OR HIGHER
            if (util.isPc)
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            childAspectRatio: 0.5),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      return BookCard(book: books[index]);
                    }),
              ),
          ],
        ),
      )),
    );
  }
}
