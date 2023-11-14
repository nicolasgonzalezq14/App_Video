import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:app_video/models/movie_model.dart';

class MoviePlayerScreen extends StatefulWidget {
  final Movie movie;

  const MoviePlayerScreen({Key? key, required this.movie}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MoviePlayerScreenState createState() => _MoviePlayerScreenState();
}

class _MoviePlayerScreenState extends State<MoviePlayerScreen> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset(widget.movie.videoPath)
      ..initialize().then((_) => setState(() {}));
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Chewie(controller: chewieController),
      ),
    );
  }
}