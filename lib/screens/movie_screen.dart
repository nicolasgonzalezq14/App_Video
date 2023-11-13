import 'package:app_video/models/movie_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;
  const MovieScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ..._buildBackground(context, movie),
          _buildMovieInformation(context),
          _buildActions(context),
        ],
      ),
    );
  }

// Boton de Añade a ver mas tarde //
  Positioned _buildActions(BuildContext context) {
    return Positioned(
      bottom: 50,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
                // ignore: deprecated_member_use
                primary: const Color(0xFFFF7272),
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.425,
                  50,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () {},
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                  children: [
                    TextSpan(
                      text: 'Ver más tarde.',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            //Boton ver pelicula
            const SizedBox(width: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15.0),
                // ignore: deprecated_member_use
                primary: const Color.fromARGB(255, 227, 14, 14),
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.425,
                  50,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _MoviePlayer(movie: movie),
                  ),
                );
              },
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                  children: [
                    TextSpan(
                      text: 'Ver Pelicula',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//Informacion de la pelicula
  Positioned _buildMovieInformation(BuildContext context) {
    return Positioned(
      bottom: 150,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              movie.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${movie.year} | ${movie.category}  | ${movie.duration.inHours}h  | ${movie.duration.inMinutes.remainder(60)}m',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //Clasificacion Estrellas
            RatingBar.builder(
              initialRating: 3.5,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              ignoreGestures: true,
              itemCount: 5,
              itemSize: 20,
              unratedColor: Colors.white,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              },
              onRatingUpdate: (rating) {},
            ),
            //Texto descripcion
            const SizedBox(height: 20),
            Text(
              'Este es un video de prueba para ver la descripcion de los videos a prueba que colocaremos en el proyecto',
              maxLines: 8,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(height: 1.75, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

//metodo imagen
  List<Widget> _buildBackground(
    context,
    movie,
  ) {
    return [
      Container(
        height: double.infinity,
        color: const Color(0xFF000B49),
      ),
      // ignore: avoid_unnecessary_containers
      Container(
        child: Image.network(
          movie.imagePath,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          fit: BoxFit.cover,
        ),
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
              end: Alignment.topCenter,
              stops: [0.3, 0.5],
            ),
          ),
        ),
      ),
    ];
  }
}

class _MoviePlayer extends StatefulWidget {
  const _MoviePlayer({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  State<_MoviePlayer> createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<_MoviePlayer> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();

    videoPlayerController = VideoPlayerController.asset(widget.movie.videoPath)
      ..initialize().then((value) {
        setState(() {});
      });
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController, aspectRatio: 16 / 9);
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
        child: Chewie(
          controller: chewieController,
        ),
      ),
    );
  }
}
