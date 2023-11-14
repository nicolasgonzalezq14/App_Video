import 'package:flutter/material.dart';
import 'parallax_flow_delegate.dart';

class MovieListItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String information;
  final GlobalKey backgroundImageKey = GlobalKey();

  MovieListItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.information,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Stack(
            children: [
              Flow(
                delegate: ParallaxFlowDelegate(
                  scrollable: Scrollable.of(context),
                  listItemContext: context,
                  backgroundImageKey: backgroundImageKey,
                ),
                children: [
                  Image.network(
                    imageUrl,
                    key: backgroundImageKey,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      // ignore: prefer_const_literals_to_create_immutables
                      stops: [0.6, 0.95],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      information,
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


