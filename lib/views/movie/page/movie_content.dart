import 'package:flutter/material.dart';
import '../../../utils/style.dart';

class MovieContent extends StatelessWidget {
  const MovieContent({
    Key? key,
    required this.image,
    required this.title,
    required this.director,
    required this.rating,
    required this.onTapArgs,
  }) : super(key: key);

  final String image;
  final String title;
  final String director;
  final double rating;
  final Object onTapArgs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Ink(
        decoration: BoxDecoration(
          color: greyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                image,
              ),
            ),
            title: Text(
              title,
              style: titleText(15),
            ),
            subtitle: Text(
              director,
              style: subtitleText(12),
            ),
            trailing: Text(
              '$rating/10',
              style: titleText(12),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/movie_detail',
              arguments: onTapArgs,
            );
          },
        ),
      ),
    );
  }
}
