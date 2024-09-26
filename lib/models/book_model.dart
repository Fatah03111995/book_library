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

  BookModel copyWith({
    String? bookId,
    String? imageUrl,
    String? title,
    String? author,
    String? isbn,
    String? penerbit,
    String? description,
    Category? category,
    Availability? availability,
  }) {
    return BookModel(
      bookId: bookId ?? this.bookId,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      author: author ?? this.author,
      isbn: isbn ?? this.isbn,
      penerbit: penerbit ?? this.penerbit,
      description: description ?? this.description,
      category: category ?? this.category,
      availability: availability ?? this.availability,
    );
  }
}
