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
  TextEditingController searchController = TextEditingController();

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
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Util util = Util(context);
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            //-------------NAVBAR
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: util.isPhone ? 120 : 80,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.1)
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      )
                    ]),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: util.isPhone
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Book Library',
                            textAlign: TextAlign.center,
                            style: defaultTxt.copyWith(
                              letterSpacing: 3,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
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
            ),
            const SizedBox(height: 20),

            //----------------MAIN SECTION
            Expanded(
              child: SizedBox(
                width: util.width * 0.8,
                child: Column(children: [
                  if (index == 0)
                    SizedBox(
                      width: 0.5 * util.width,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: 'Find Your Favorite Book Here ...',
                            hintStyle: defaultTxt,
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.5),
                            suffixIcon: IconButton(
                                onPressed: () {}, icon: Icon(Icons.search))),
                      ),
                    ),
                  if (index == 0) const SizedBox(height: 20),
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
