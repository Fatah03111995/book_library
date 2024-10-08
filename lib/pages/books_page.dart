import 'package:book_library/const/const.dart';
import 'package:book_library/models/book_model.dart';
import 'package:book_library/util/util.dart';
import 'package:book_library/widget/book_card.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {
  final Util util;
  final List<BookModel> books;
  final List<String> favBooks;
  final Function(String) toggleFav;
  const BooksPage(
      {super.key,
      required this.util,
      required this.books,
      required this.favBooks,
      required this.toggleFav});

  @override
  Widget build(BuildContext context) {
    //-------------------MAIN SECTION

    if (books.isEmpty) {
      return Expanded(
        child: Center(
          child: Text('Not Found',
              textAlign: TextAlign.center,
              style: defaultTxt.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
      );
    }

    //-------------------IF PHONE DEVICE
    if (util.isPhone) {
      return Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 0.5),
            itemCount: books.length,
            itemBuilder: (context, index) {
              return BookCard(
                book: books[index],
                favBooks: favBooks,
                toggleFav: toggleFav,
              );
            }),
      );
    }

    if (util.isTablet) {
      //-------------------IF TABLET DEVICE
      return Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 0.5),
            itemCount: books.length,
            itemBuilder: (context, index) {
              return BookCard(
                book: books[index],
                favBooks: favBooks,
                toggleFav: toggleFav,
              );
            }),
      );
    }

    return Expanded(
      // ----------------IF PC OR HIGHER
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 0.5),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return BookCard(
              book: books[index],
              favBooks: favBooks,
              toggleFav: toggleFav,
            );
          }),
    );
  }
}
