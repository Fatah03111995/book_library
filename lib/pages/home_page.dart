import 'dart:ui';

import 'package:book_library/const/const.dart';
import 'package:book_library/data_provider/dummy.dart';
import 'package:book_library/models/book_model.dart';
import 'package:book_library/pages/books_page.dart';
import 'package:book_library/pages/favourite_page.dart';
import 'package:book_library/util/util.dart';
import 'package:book_library/widget/menu_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BookModel> books = Dummy.books;
  List<String> favBooks = [];
  int index = 0;

  void toggleFav(String bookId) {
    setState(() {
      if (favBooks.contains(bookId)) {
        favBooks.remove(bookId);
      } else {
        favBooks.add(bookId);
      }
    });
  }

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
              color: Colors.lightBlue,
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
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
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

            //----------------MAIN SECTION
            Expanded(
              child: SizedBox(
                width: util.width * 0.8,
                child: Column(children: [
                  if (index == 0)
                    BooksPage(
                        util: util,
                        books: books,
                        favBooks: favBooks,
                        toggleFav: toggleFav),
                  if (index == 1)
                    Builder(builder: (context) {
                      List<BookModel> filteredBooks = [
                        ...books.where((book) => favBooks.contains(book.bookId))
                      ];
                      return FavouritePage(
                          util: util,
                          books: filteredBooks,
                          favBooks: favBooks,
                          toggleFav: toggleFav);
                    }),
                ]),
              ),
            )
          ],
        ),
      )),
    );
  }
}
