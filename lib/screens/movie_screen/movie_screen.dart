import 'package:flutter/material.dart';
import 'package:app_video/models/movie_model.dart';
import 'movie_actions.dart';
import 'movie_information.dart';
import 'movie_background.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;
  const MovieScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MovieBackground(context: context, movie: movie),
          MovieInformation(movie: movie),
          MovieActions(context: context, movie: movie),
        ],
      ),
    );
  }
}