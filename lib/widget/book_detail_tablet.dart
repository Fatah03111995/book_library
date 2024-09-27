import 'package:book_library/const/const.dart';
import 'package:book_library/models/book_model.dart';
import 'package:book_library/util/util.dart';
import 'package:flutter/material.dart';

class BookDetailTablet extends StatelessWidget {
  final BookModel book;
  final List<Widget> bookInfo;
  const BookDetailTablet({
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
      child: SafeArea(child: Center(
        child: Builder(builder: (context) {
          return SingleChildScrollView(
            //----------CARD CONTAINER
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: util.width * 0.1, bottom: util.width * 0.1),
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
                            fontSize: 14,
                            letterSpacing: 1.2,
                            height: 2,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Hero(
                        tag: book.bookId,
                        child: Image.asset(
                          book.imageUrl,
                          fit: BoxFit.cover,
                          height: util.width * 0.2 * 3,
                        ),
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
              ],
            ),
          );
        }),
      )),
    );
  }
}
