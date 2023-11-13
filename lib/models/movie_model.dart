class Movie {
  final String name;
  final String imagePath;
  final String videoPath;
  final String category;
  final int year;
  final Duration duration;

  const Movie(
      {required this.name,
      required this.imagePath,
      required this.videoPath,
      required this.category,
      required this.year,
      required this.duration});

  static const List<Movie> movies = [
    Movie(
      name: 'Momento Xd',
      imagePath:
          'https://img.desmotivaciones.es/202106/memes-imagenes-34.jpg',
      videoPath: 'assets/videos/example.mp4',
      category: 'Drama',
      year: 2022,
      duration: Duration(hours: 2, minutes: 22),
    ),
  ];
}
