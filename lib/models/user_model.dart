// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String userId;
  final String userName;
  final String password;
  final List<String> favourite;
  final List<String> borrowedBook;
  UserModel({
    required this.userId,
    required this.userName,
    required this.password,
    required this.favourite,
    required this.borrowedBook,
  });
}
