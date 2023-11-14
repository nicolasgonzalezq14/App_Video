import 'package:flutter/material.dart';

import 'package:app_video/models/movie_model.dart';



class MovieInformation extends StatelessWidget {
  final Movie movie;

  const MovieInformation({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 150,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.name, // Este texto es estático, pero viene del objeto movie.
              style: const TextStyle(
                color: Color.fromARGB(255, 247, 244, 244),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${movie.year} | ${movie.category} | ${_formatDuration(movie.duration)}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            _buildStaticRatingBar(),
            const SizedBox(height: 8),
            const Text(
              "Este es un video de prueba para ver la descripción de los videos prueba que colocaremos en el proyecto.",
              style: TextStyle(
                color: Color.fromARGB(255, 248, 244, 244),
                fontSize: 14,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStaticRatingBar() {
    // Crear una barra de clasificación estática con 3.5 estrellas
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < 3 || (index == 3 && index < 3.5) ? Icons.star : Icons.star_border,
          color: index < 3 || (index == 3 && index < 3.5) ? Colors.amber : Colors.grey,
          size: 20,
        );
      }),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return "${twoDigits(duration.inHours)}h ${twoDigitMinutes}m";
  }
}