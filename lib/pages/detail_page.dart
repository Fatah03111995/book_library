import 'package:book_library/const/const.dart';
import 'package:book_library/models/book_model.dart';
import 'package:book_library/util/util.dart';
import 'package:book_library/widget/book_detail_phone.dart';
import 'package:book_library/widget/book_detail_pc.dart';
import 'package:book_library/widget/book_detail_tablet.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final BookModel book;
  final List<String> favBooks;
  final Function(String) toggleFav;
  const DetailPage(
      {super.key,
      required this.book,
      required this.favBooks,
      required this.toggleFav});

  @override
  Widget build(BuildContext context) {
    final Util util = Util(context);
    List<Widget> bookInfo = [
      //---------------AUTHOR
      Row(
        children: [
          SizedBox(
            width: 30,
            child: Icon(
              Icons.person,
              size: util.isPhone
                  ? 20
                  : util.isTablet
                      ? 22
                      : 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Penulis',
                    style: defaultTxt.copyWith(
                      height: 2,
                      fontSize: 12,
                    )),
                Text(book.author,
                    style: defaultTxt.copyWith(
                        fontSize: util.isPc ? 14 : 12,
                        letterSpacing: 1.5,
                        height: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            ),
          ),
        ],
      ),

      //--------------- ISBN
      Row(
        children: [
          SizedBox(
            width: 30,
            child: Icon(
              Icons.key,
              size: util.isPhone
                  ? 20
                  : util.isTablet
                      ? 22
                      : 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ISBN',
                    style: defaultTxt.copyWith(
                      height: 2,
                      fontSize: 12,
                    )),
                Text(book.isbn,
                    style: defaultTxt.copyWith(
                        fontSize: util.isPc ? 14 : 12,
                        letterSpacing: 1.5,
                        height: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            ),
          ),
        ],
      ),

      //-------------PENERBIT
      Row(
        children: [
          SizedBox(
            width: 30,
            child: Icon(
              Icons.public,
              size: util.isPhone
                  ? 20
                  : util.isTablet
                      ? 22
                      : 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Penerbit',
                    style: defaultTxt.copyWith(
                      height: 2,
                      fontSize: 12,
                    )),
                Text(book.penerbit,
                    style: defaultTxt.copyWith(
                        fontSize: util.isPc ? 14 : 12,
                        height: 2,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    ];

    return Scaffold(
        //--------------- BACKGROUND
        body: util.isPhone
            ? BookDetailPhone(book: book, bookInfo: bookInfo)
            : util.isTablet
                ? BookDetailTablet(book: book, bookInfo: bookInfo)
                : BookDetailPc(book: book, bookInfo: bookInfo));
  }
}
