import 'package:book_library/const/const.dart';
import 'package:book_library/models/book_model.dart';
import 'package:book_library/util/util.dart';
import 'package:flutter/material.dart';

class BookDetailPhone extends StatelessWidget {
  final BookModel book;
  final List<Widget> bookInfo;
  const BookDetailPhone({
    super.key,
    required this.book,
    required this.bookInfo,
  });

  @override
  Widget build(BuildContext context) {
    Util util = Util(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.lightBlue, Colors.lightBlue[300]!],
        ),
      ),
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            child: Hero(
              tag: book.bookId,
              child: Image.asset(
                book.imageUrl,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                width: double.infinity,
                height: 0.5 * util.height,
              ),
            ),
          ),
          SafeArea(
              child: Center(
            child: SingleChildScrollView(
              //----------CARD CONTAINER
              child: Container(
                margin: const EdgeInsets.only(top: 250),
                width: util.width * 0.7,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.1)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      )
                    ]),

                //-----------------MAIN SECTION
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      book.title,
                      textAlign: TextAlign.center,
                      style: defaultTxt.copyWith(
                          fontSize: 12,
                          letterSpacing: 1.2,
                          height: 2,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    ...bookInfo,
                    const SizedBox(height: 15),
                    Text(
                      book.description,
                      textAlign: TextAlign.justify,
                      style: defaultTxt.copyWith(
                        fontSize: 11,
                        height: 2,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
