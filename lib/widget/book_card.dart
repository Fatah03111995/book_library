import 'package:book_library/const/const.dart';
import 'package:book_library/models/book_model.dart';
import 'package:book_library/models/enum.dart';
import 'package:book_library/pages/detail_page.dart';
import 'package:book_library/util/util.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final BookModel book;
  final List<String> favBooks;
  final Function(String) toggleFav;
  const BookCard(
      {super.key,
      required this.book,
      required this.favBooks,
      required this.toggleFav});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                    book: book, favBooks: favBooks, toggleFav: toggleFav)));
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Hero(
              tag: book.bookId,
              child: Image.asset(
                height: double.infinity,
                book.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (book.availability == Availability.borrowed)
                  Expanded(
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      alignment: Alignment.center,
                      child: Text(
                        'Borrowed',
                        style: defaultTxt.copyWith(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                Container(
                  height: 70 + Util(context).width / 400 * 10,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          end: AlignmentDirectional.topCenter,
                          begin: AlignmentDirectional.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.9)
                          ]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.1),
                          blurRadius: 10,
                        )
                      ]),
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  child: Text(
                    book.title,
                    textAlign: TextAlign.center,
                    style: defaultTxt.copyWith(
                      fontSize: 12,
                      color: Colors.white,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: favBooks.contains(book.bookId)
                      ? Colors.red
                      : Colors.black.withOpacity(0.7),
                ),
                onPressed: () {
                  toggleFav(book.bookId);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
