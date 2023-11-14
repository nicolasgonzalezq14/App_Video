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
      name: 'Video Prueba',
      imagePath: 'https://img.desmotivaciones.es/202106/memes-imagenes-34.jpg',
      videoPath: 'assets/videos/example.mp4',
      category: 'Comedia',
      year: 2023,
      duration: Duration(hours: 0, minutes: 1),
    ),
    Movie(
      name: 'Rápidos y furiosos 10',
      imagePath:
          'https://i.imgur.com/x0uYMFJ.jpeg',
      videoPath: 'assets/videos/rapidoyfuriososx.mp4',
      category: 'Acción',
      year: 2022,
      duration: Duration(hours: 2, minutes: 21),
    ),
    Movie(
      name: 'El señor de los anillos',
      imagePath: 'https://i0.wp.com/carlosjeguren.com/wp-content/uploads/2012/12/El-Se25C325B1or-de-los-Anillos-La-Comunidad-del-Anillo.jpg?ssl=1',
      videoPath: 'assets/videos/elsenordelosanillos.mp4',
      category: 'Acción',
      year: 2001,
      duration: Duration(hours: 2, minutes: 58),
    ),
    Movie(
      name: 'Harry Potter y la piedra filosofal',
      imagePath: 'https://larepublica.cronosmedia.glr.pe/original/2021/10/28/617b0722cd5ff4650728ef2d.jpg',
      videoPath: 'assets/videos/harrypotterylapiedrafilosofal.mp4',
      category: 'Cine de terror',
      year: 2001,
      duration: Duration(hours: 2, minutes: 32),
    ),
    Movie(
      name: 'Elementos',
      imagePath: 'https://lumiere-a.akamaihd.net/v1/images/eu_xx_elemental_dplus_mob_m_60031c24.jpeg?region=0,0,1600,1200',
      videoPath: 'assets/videos/elementos.mp4',
      category: 'Comedia Romántica',
      year: 2023,
      duration: Duration(hours: 1, minutes: 42),
      
    ),
  ];
}
