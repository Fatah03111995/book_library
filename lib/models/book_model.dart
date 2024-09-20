// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:book_library/models/enum.dart';

class BookModel {
  final String bookId;
  final String imageUrl;
  final String title;
  final String author;
  final String isbn;
  final String penerbit;
  final String description;
  final Category category;
  final Availability availability;

  BookModel(
      {required this.bookId,
      required this.imageUrl,
      required this.title,
      required this.author,
      required this.isbn,
      required this.penerbit,
      required this.description,
      required this.category,
      required this.availability});
}
