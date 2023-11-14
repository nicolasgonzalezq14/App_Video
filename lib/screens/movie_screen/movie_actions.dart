import 'package:flutter/material.dart';
import 'package:app_video/models/movie_model.dart';
import 'movie_player_screen.dart';

class MovieActions extends StatelessWidget {
  final Movie movie;
  final BuildContext context;

  const MovieActions({Key? key, required this.context, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildWatchLaterButton(context),
            const SizedBox(width: 10),
            _buildWatchMovieButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildWatchLaterButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15.0),
        backgroundColor: const Color(0xFFFF7272),
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.425,
          50,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      onPressed: () {
        // Implementar funcionalidad para "Ver más tarde"
      },
      child: const Text(
        'Ver más tarde',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildWatchMovieButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15.0), backgroundColor: const Color.fromARGB(255, 227, 14, 14),
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.425,
          50,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoviePlayerScreen(movie: movie),
          ),
        );
      },
      child: const Text(
        'Ver Película',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
