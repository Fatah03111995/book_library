import 'package:book_library/const/const.dart';
import 'package:book_library/models/book_model.dart';
import 'package:book_library/util/util.dart';
import 'package:book_library/widget/book_card.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  final Util util;
  final List<BookModel> books;
  final List<String> favBooks;
  final Function(String) toggleFav;
  const FavouritePage(
      {super.key,
      required this.util,
      required this.books,
      required this.favBooks,
      required this.toggleFav});

  @override
  Widget build(BuildContext context) {
    //-------------------MAIN SECTION

    //------------------IF LIST IS EMPTY
    if (books.isEmpty) {
      return Expanded(
          child: Center(
        child: Text('There is no Data Here !',
            textAlign: TextAlign.center,
            style: defaultTxt.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ));
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

    //-------------------IF TABLET DEVICE
    if (util.isTablet) {
      return Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
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

    // ----------------IF PC OR HIGHER

    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
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
