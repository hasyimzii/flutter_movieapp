import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/style.dart';

import '../../../widgets/submit_button.dart';

import 'information_section.dart';

class MoviePanel extends StatelessWidget {
  const MoviePanel({
    Key? key,
    required this.title,
    required this.director,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.age,
    required this.genre,
    required this.description,
    required this.url,
  }) : super(key: key);

  final String title;
  final String director;
  final String year;
  final String rating;
  final String runtime;
  final String age;
  final String genre;
  final String description;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 0, right: 0),
          title: Text(
            title,
            style: titleText(18),
          ),
          subtitle: Text(
            director,
            style: subtitleText(15),
          ),
          trailing: Text(
            year,
            style: titleText(15),
          ),
        ),
        SubmitButton(
          title: 'Watch Trailer',
          icon: Icons.theaters,
          onTap: () {
            launchUrl(
              Uri.parse(url),
            );
          },
        ),
        const SizedBox(height: 10),
        Information(
          rating: rating,
          runtime: runtime,
          age: age,
        ),
        const SizedBox(height: 10),
        Text(
          'Genre',
          style: titleText(15),
        ),
        Text(
          genre,
          style: subtitleText(13),
        ),
        const SizedBox(height: 10),
        Text(
          'Description',
          style: titleText(15),
        ),
        Text(
          description,
          style: subtitleText(13),
        ),
      ],
    );
  }
}
