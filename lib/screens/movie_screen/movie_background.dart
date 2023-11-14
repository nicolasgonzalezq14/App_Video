import 'package:flutter/material.dart';
import 'package:app_video/models/movie_model.dart';

class MovieBackground extends StatelessWidget {
  final Movie movie;
  final BuildContext context;

  const MovieBackground({Key? key, required this.context, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          color: const Color(0xFF000B49),
        ),
        Image.network(
          movie.imagePath,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          fit: BoxFit.cover,
        ),
        const Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Color(0xFF000B49),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
