import 'package:flutter/material.dart';
import '../widgets/scaffold_theme.dart';
import '../widgets/list_content.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List items = [Text('asd'),Text('asd'),Text('asd'),];
  @override
  Widget build(BuildContext context) {
    return ScaffoldTheme(
      title: 'Movie List',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ListContent(
              leading: 'assets/images/poster.jpg',
              title: 'The Godfather',
              subtitle: 'Francis Ford Coppola',
              onTap: () {},
            ),
            const SizedBox(height: 15),
            ListContent(
              leading: 'assets/images/poster1.jpg',
              title: 'Star Wars IV',
              subtitle: 'George Lucas',
              onTap: () {},
            ),
            const SizedBox(height: 15),
            ListContent(
              leading: 'assets/images/poster2.jpg',
              title: 'Django Unchained',
              subtitle: 'Quentin Tarantino',
              onTap: () {},
            ),
            const SizedBox(height: 15),
            ListContent(
              leading: 'assets/images/poster3.jpg',
              title: '12 Angry Men',
              subtitle: 'Sidney Lumet',
              onTap: () {},
            ),
            const SizedBox(height: 15),
            ListContent(
              leading: 'assets/images/poster4.jpg',
              title: 'Scarface',
              subtitle: 'Brian De Palma',
              onTap: () {},
            ),
            const SizedBox(height: 15),
            ListContent(
              leading: 'assets/images/poster5.jpg',
              title: 'The Pianist',
              subtitle: 'Roman Polanski',
              onTap: () {},
            ),
            const SizedBox(height: 15),
            ListContent(
              leading: 'assets/images/poster6.jpg',
              title: 'Taxi Driver',
              subtitle: 'Martin Scorsese',
              onTap: () {},
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
