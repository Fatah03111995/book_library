import 'package:book_library/const/const.dart';
import 'package:book_library/models/book_model.dart';
import 'package:book_library/util/util.dart';
import 'package:flutter/material.dart';

class BookDetailPc extends StatelessWidget {
  final BookModel book;
  final List<Widget> bookInfo;
  const BookDetailPc({
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
            child: Container(
              margin: EdgeInsets.only(
                  top: util.width * 0.1, bottom: util.width * 0.1),
              width: util.width * 0.7,
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 100),
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
                        fontSize: 20,
                        letterSpacing: 1.2,
                        height: 2,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: util.width * 0.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.asset(
                              book.imageUrl,
                              width: util.width * 0.2,
                              fit: BoxFit.cover,
                              height: util.width * 0.2 * 1.3,
                            ),
                            ...bookInfo,
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                          child: Text(
                        book.description,
                        textAlign: TextAlign.justify,
                        style: defaultTxt.copyWith(
                          fontSize: 14,
                          height: 2,
                          letterSpacing: 1.2,
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      )),
    );
  }
}
