import 'package:book_library/const/const.dart';
import 'package:book_library/models/book_model.dart';
import 'package:book_library/models/enum.dart';
import 'package:book_library/util/util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final BookModel book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    Util util = Util(context: context);

    double height = 100;
    if (util.isPhone) {
      height += (util.width * 5 / 100);
      if (util.width > 250) {
        height += (util.width * 30 / 100);
      }
      if (util.width > 350) {
        height += (util.width * 10 / 100);
      }

      height = clampDouble(height, 100, 250);
    }
    if (util.isTablet) {
      height = 100;
      height += (util.width * 5 / 100);
      if (util.width > 550) {
        height += (util.width * 5 / 100);
      }
      if (util.width > 650) {
        height += (util.width * 10 / 100);
      }

      if (util.width > 750) {
        height += (util.width * 5 / 100);
      }

      height = clampDouble(height, 130, 200);
    }
    if (util.isPc) {
      height = 100;
      height += (util.width * 5 / 100);
      if (util.width > 850) {
        height += (util.width * 5 / 100);
      }
      if (util.width > 1150) {
        height += (util.width * 5 / 100);
      }
      height = clampDouble(height, 100, 250);
    }

    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(book.imageUrl),
              fit: BoxFit.cover,
            )),
            child: book.availability == Availability.borrowed
                ? Container(
                    height: height,
                    color: Colors.black.withOpacity(0.5),
                    alignment: Alignment.center,
                    child: Text(
                      'Borrowed',
                      style: defaultTxt.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : null,
          ),
          Expanded(
            child: Center(
              child: Text(
                book.title,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
