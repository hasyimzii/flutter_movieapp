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
      body: ListView(
        children: [
          const SizedBox(height: 30),
          const PosterImage(
            image: 'assets/images/poster.jpg',
          ),
          const SizedBox(height: 40),
          Content(
            topIcon: Icons.bookmark,
            body: [
              const TitleTile(
                title: 'The Godfather',
                subtitle: 'Francis Ford Coppola',
                year: '1972',
              ),
              const SizedBox(height: 5),
              SubmitButton(
                title: 'Watch Now',
                icon: Icons.theaters,
                onTap: () {},
              ),
              const SizedBox(height: 10),
              const Information(
                rating: '5.0',
                runtime: '2h 55min',
                age: '18+',
              ),
              const SizedBox(height: 10),
              const Description(
                title: 'Genre',
                subtitle: 'Crime, Drama, Mafia',
              ),
              const Description(
                title: 'Cast',
                subtitle: 'Marlon Brando, Al Pacino, James Caan, More',
              ),
              const Description(
                title: 'Description',
                subtitle: 'An organized crime dynastys '
                    'aging patriarch transfers '
                    'control of his clandestine '
                    'empire to his reluctant son.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
