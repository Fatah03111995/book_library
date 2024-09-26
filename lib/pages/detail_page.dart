import 'package:book_library/const/const.dart';
import 'package:book_library/data_provider/dummy.dart';
import 'package:book_library/models/book_model.dart';
import 'package:book_library/models/enum.dart';
import 'package:book_library/util/util.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final BookModel book;
  final List<String> favBooks;
  final Function(String) toggleFav;
  const DetailPage(
      {super.key,
      required this.book,
      required this.favBooks,
      required this.toggleFav});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  BookModel? book;
  @override
  void initState() {
    book = widget.book;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Util util = Util(context);
    List<Widget> bookInfo = [
      //---------------AUTHOR
      Row(
        children: [
          const SizedBox(
            width: 30,
            child: Icon(
              Icons.person,
              size: 30,
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
                Text(book!.author,
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
          const SizedBox(
            width: 30,
            child: Icon(
              Icons.key,
              size: 30,
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
                Text(book!.isbn,
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
          const SizedBox(
            width: 30,
            child: Icon(
              Icons.public,
              size: 30,
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
                Text(book!.penerbit,
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
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue, Colors.lightBlue[300]!],
          ),
        ),
        child: SafeArea(child: Center(
          child: Builder(builder: (context) {
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                    top: util.width * 0.1, bottom: util.width * 0.1),
                width: util.width * 0.7,
                padding: EdgeInsets.symmetric(
                    horizontal: util.isPhone ? 50 : 100,
                    vertical: util.isPhone ? 25 : 100),
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
                      book!.title,
                      textAlign: TextAlign.center,
                      style: defaultTxt.copyWith(
                          fontSize: util.isPhone ? 14 : 20,
                          letterSpacing: 1.2,
                          height: 2,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: util.isPhone ? 20 : 50),
                    // --------------tablet and phone display
                    if (util.isPhone || util.isTablet)
                      Image.asset(
                        book!.imageUrl,
                        fit: BoxFit.cover,
                        height: util.width * 0.2 * 3,
                      ),
                    if (util.isPhone || util.isTablet)
                      const SizedBox(height: 30),
                    if (util.isPhone || util.isTablet) ...bookInfo,
                    if (util.isPhone || util.isTablet)
                      const SizedBox(height: 30),
                    if (util.isPhone || util.isTablet)
                      Text(
                        book!.description,
                        textAlign: TextAlign.justify,
                        style: defaultTxt.copyWith(
                          fontSize: util.isPc ? 14 : 12,
                          height: 2,
                          letterSpacing: 1.2,
                        ),
                      ),

                    //---------------if pc
                    if (util.isPc)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: util.width * 0.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Image.asset(
                                  book!.imageUrl,
                                  width: util.width * 0.2,
                                  fit: BoxFit.cover,
                                  height: util.width * 0.2 * 1.3,
                                ),
                                ...bookInfo,
                                const SizedBox(height: 30),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      print('work');
                                      if (book!.availability ==
                                          Availability.available) {
                                        book!.copyWith(
                                            availability:
                                                Availability.borrowed);
                                      } else {
                                        book!.copyWith(
                                            availability:
                                                Availability.available);
                                      }
                                      Dummy.books = [...Dummy.books, book!];
                                      return;
                                    });
                                  },
                                  child: Text(
                                    book!.availability == Availability.available
                                        ? 'Pinjam'
                                        : 'Kembalikan',
                                    style: defaultTxt.copyWith(
                                        color: Colors.black,
                                        fontSize: util.isPhone ? 12 : 14),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                              child: Text(
                            book!.description,
                            textAlign: TextAlign.justify,
                            style: defaultTxt.copyWith(
                              fontSize: util.isPc ? 14 : 12,
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
      ),
    );
  }
}
