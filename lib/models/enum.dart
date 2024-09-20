enum Category {
  biografi(title: 'Biografi'),
  fiksi(title: 'Fiksi'),
  nonFiksi(title: 'Non Fiksi'),
  sejarah(title: 'Sejarah');

  final String title;
  const Category({required this.title});
}

enum Availability { available, borrowed }
