import 'package:flutter/material.dart';
import '../widgets/scaffold_theme.dart';
import '../widgets/poster_image.dart';
import '../widgets/content.dart';
import '../widgets/title_tile.dart';
import '../widgets/submit_button.dart';
import '../widgets/information.dart';
import '../widgets/description.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldTheme(
      title: 'Movie Details',
      body: Column(
        children: const [
          SizedBox(height: 30),
          PosterImage(
            image: 'assets/images/poster.jpg',
          ),
          SizedBox(height: 40),
          Content(
            topIcon: Icons.bookmark,
            body: [
              TitleTile(
                title: 'The Godfather',
                subtitle: 'Francis Ford Coppola',
                year: '1972',
              ),
              SizedBox(height: 5),
              SubmitButton(
                title: 'Watch Now',
                icon: Icons.theaters,
              ),
              SizedBox(height: 10),
              Information(
                rating: '5.0',
                runtime: '2h 55min',
                age: '18+',
              ),
              SizedBox(height: 10),
              Description(
                title: 'Genre',
                subtitle: 'Crime, Drama, Mafia',
              ),
              Description(
                title: 'Cast',
                subtitle: 'Marlon Brando, Al Pacino, James Caan, More',
              ),
              Description(
                  title: 'Description',
                  subtitle: 'An organized crime dynastys '
                      'aging patriarch transfers '
                      'control of his clandestine '
                      'empire to his reluctant son.'),
            ],
          ),
        ],
      ),
    );
  }
}
